-- client.lua

ESX = exports["es_extended"]:getSharedObject()

local playerHoras = 0

-- Fetch player hours from the server
ESX.TriggerServerCallback("pekehoras:obtenerinfo", function(data)
    if data then
        playerHoras = data.playerHoras
    else
        print("Error: No se recibieron datos del servidor.")
    end
end)

-- Thread to update player hours every hour
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3600000) -- Wait for one hour (3600000 milliseconds)
        TriggerServerEvent("pekehoras:actualizahoras")
    end
end)

-- Function to calculate distance between two points
local function calculateDistance(x1, y1, z1, x2, y2, z2)
    local dx = x1 - x2
    local dy = y1 - y2
    local dz = z1 - z2
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

-- Function to create a blip for the GreenArea
local function createGreenAreaBlip()
    local center = Config.GreenArea.center
    local blip = AddBlipForRadius(center.x, center.y, center.z, Config.GreenArea.radius) -- Add a blip for the radius
    SetBlipSprite(blip, 9) -- Set the blip sprite to display a circle
    SetBlipColour(blip, 2) -- Set the blip color to green
    SetBlipAlpha(blip, 128) -- Set the blip transparency
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Green Area")
    EndTextCommandSetBlipName(blip)
end

-- Main thread to monitor player's position and draw the green area
Citizen.CreateThread(function()
    createGreenAreaBlip() -- Ensure the blip is created and visible
    while true do
        Citizen.Wait(1000) -- Check player's position every second

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local distance = calculateDistance(
            playerCoords.x, playerCoords.y, playerCoords.z,
            Config.GreenArea.center.x, Config.GreenArea.center.y, Config.GreenArea.center.z
        )

        if distance > Config.GreenArea.radius then
            if playerHoras < 1 then
                -- Trigger event to jail the player for 60 minutes
                TriggerServerEvent("pekehoras:jailPlayer", 60)
            end
        end
    end
end)

-- Command to check player's hours
RegisterCommand('horas', function()
    ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
        if horas then
            ESX.ShowNotification('Tienes ' .. horas .. " horas jugadas")
        else
            ESX.ShowNotification('No se pudo obtener la información de las horas.')
        end
    end)
end)