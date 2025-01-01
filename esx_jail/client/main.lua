local isInJail, unjail = false, false
local jailTime, fastTimer = 0, 0
ESX = nil
ESX = exports["es_extended"]:getSharedObject()

if ESX == nil then
    print("Error: ESX object is nil. Ensure that es_extended is started before this script.")
    return
end

if not ESX.TriggerServerCallback then
    print("Error: ESX.TriggerServerCallback is not available. Ensure that es_extended is properly initialized.")
    return
end

-- Function to check player's hours and jail if less than 1 hour
function checkPlayerHoursAndJail()
    ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
        if horas and horas < 1 then
            TriggerEvent('esx_jail:jailPlayer', 60) -- Jail for 1 minute if less than 1 hour
        end
    end)
end

RegisterNetEvent('esx_jail:jailPlayer')
AddEventHandler('esx_jail:jailPlayer', function(_jailTime)
    jailTime = _jailTime

    local playerPed = PlayerPedId()

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.male)
        else
            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.female)
        end
    end)

    SetPedArmour(playerPed, 0)
    ESX.Game.Teleport(playerPed, Config.JailLocation)
    isInJail, unjail = true, false

    while not unjail do
        playerPed = PlayerPedId()

        RemoveAllPedWeapons(playerPed, true)
        if IsPedInAnyVehicle(playerPed, false) then
            ClearPedTasksImmediately(playerPed)
        end

        Citizen.Wait(20000)

        -- Is the player trying to escape?
        if #(GetEntityCoords(playerPed) - Config.JailLocation) > 10 then
            ESX.Game.Teleport(playerPed, Config.JailLocation)
            TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
        end
    end

    ESX.Game.Teleport(playerPed, Config.JailBlip)
    isInJail = false

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if jailTime > 0 and isInJail then
            if fastTimer < 0 then
                fastTimer = jailTime
            end

            draw2dText(_U('remaining_msg', ESX.Math.Round(fastTimer)), 0.175, 0.955)
            fastTimer = fastTimer - 0.01
            if fastTimer <= 0 then
                TriggerEvent('esx_jail:unjailPlayer')
            end
        else
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('esx_jail:unjailPlayer')
AddEventHandler('esx_jail:unjailPlayer', function()
    unjail, jailTime, fastTimer = true, 0, 0
end)

AddEventHandler('playerSpawned', function(spawn)
    if isInJail then
        ESX.Game.Teleport(PlayerPedId(), Config.JailLocation)
    end
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.JailBlip)

    SetBlipSprite(blip, 188)
    SetBlipScale (blip, 1.0)
    SetBlipColour(blip, 6)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(_U('blip_name'))
    EndTextCommandSetBlipName(blip)
    
    -- Monitor player's position relative to the blip zone
    while true do
        Citizen.Wait(1000) -- Check every second
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - Config.JailBlip)

        if distance > 10 then -- If player is outside the blip zone
            ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
                if horas and horas < 1 then
                    TriggerEvent('esx_jail:jailPlayer', 60) -- Jail for 60 minutes
                end
            end)
        end
    end
end)

function draw2dText(text, x, y)
    SetTextFont(4)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()

    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end