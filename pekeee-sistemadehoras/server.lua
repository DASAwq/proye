ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print('The resource ' .. resourceName .. ' has been started.')
	print('	^2Pekeee-Sistemadehoras ha iniciado correctamente')
	print('=====^1 ESTE ES UN SCRIPT GRATUITO ^0=====')
	print('=====^2 VISITA PEKEEESHOP.COM PARA MAS ^0=====')

	end)

ESX.RegisterServerCallback("pekehoras:obtenerinfo", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local db = result[1]
		local data = {
			playerName = xPlayer.getName(),
			playerHoras = db.horas,
		}

		cb(data)
	end)
end)

RegisterServerEvent("pekehoras:actualizahoras")
AddEventHandler("pekehoras:actualizahoras", function(cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET horas = @horas WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
		['@horas'] = cb,
	}, function (result)
	end)
end)



ESX.RegisterServerCallback("pekehoras:obtenerhoras", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT horas FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result)
		local horas = result[1]

		cb(horas.horas)
	end)
end)

-- Removed redundant event handler for 'pekehoras:obtenerhoras'