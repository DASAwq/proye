ESX = exports["es_extended"]:getSharedObject()

ESX.TriggerServerCallback("pekehoras:obtenerinfo", function(data)

    playerHoras = data.horas

end)
Citizen.CreateThread(function() 

    while true do
        Wait(1000)
        ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
            
            ESX.SetPlayerData("horas", horas)

        end)

        -- Monitor player leaving the blip
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if #(playerCoords - Config.JailBlip) > 50 then
            ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
                if horas < 1 then
                    TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(PlayerId()), 60)
                end
            end)
        end
    end
end)

RegisterCommand('horas', function (source)
    
    Citizen.CreateThread(function() 
  
            ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
                ESX.ShowNotification('Tienes ' ..horas.." horas jugadas")
            end)
    end)
end)

Citizen.CreateThread(function() 

    while true do
        Wait(Config.horas)
        ESX.TriggerServerCallback("pekehoras:obtenerhoras", function(horas)
            
            local horass = horas
            for i = 1, horass do
            sum = 1 + horass
            end

            total = sum
            print(sum)
            local totalh = total

            TriggerServerEvent("pekehoras:actualizahoras", totalh)


        end)
    end
end)