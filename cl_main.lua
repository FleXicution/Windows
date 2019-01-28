Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/windowsup', "Rolls all your windows up" )
	TriggerEvent('chat:addSuggestion', '/windowsdown', "Rolls all your windows down" )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/windowsup')
		TriggerEvent('chat:removeSuggestion', '/windowsdown')
	end
end)

Citizen.CreateThread(function()
	RegisterCommand("windowsup", function(source,args)
		local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped)
		if IsPedInAnyVehicle(ped) then
			for i = 1, 4 do
				RollUpWindow(veh, i - 1)
			end
		end
	end, false)

	RegisterCommand("windowsdown", function(source,args)
		local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped)
		if IsPedInAnyVehicle(ped) then
			for i = 1, 4 do
				RollDownWindow(veh, i - 1)
			end
		end
	end, false)
end)