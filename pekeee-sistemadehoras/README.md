# pekeee-sistemadehoras

SISTEMA DE HORAS QUE TE PERMITE BLOQUEAR OPCIONES DEPENDIENDO DE LAS HORAS JUGADAS DEL JUGADOR

MUY FACIL DE INTEGRAR CON CUALQUIER SCRIPT

USAR ESTA LINEA PARA INTEGRAR CON CUALQUIER SCRIPT 

		"local horas = ESX.GetPlayerData().horas"


EJEMPLO MOSTRADO EN EL VIDEO 

        "if IsControlJustReleased(0, 38) then
				local horas = ESX.GetPlayerData().horas 
				if horas > 10 then --- AQUI TU CONFIGURAR EL NUMERO DE HORAS QUE QUIERES ---
				if currentAction == 'shop_menu' then
					OpenShopMenu()
				end
			else
				ESX.ShowNotification('No tienes las horas suficientes')
			end
				currentAction = nil
			end"


PARA MAS SCRIPTS EN
https://pekeeeshop.com/
