ESX	= nil
math.randomseed(os.time())

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_meslekler:finishTruck')
AddEventHandler('esx_meslekler:finishTruck', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.getIdentifier()
	MySQL.Async.fetchAll('select * from users where identifier = @identifier', {['@identifier'] = identifier}, function(result)
		local truckerLevel = result[1].truckerLevel
		local pay = Config.TruckerPrice
		if truckerLevel >= 25 and truckerLevel < 75 then
			pay = pay + 2500
		elseif truckerLevel >= 75 and truckerLevel < 150 then
			pay = pay + 5000
		elseif truckerLevel >= 150 then
			pay = pay + 7500
		end
		
		xPlayer.addMoney(pay)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "Görevi tamamladınız ve " .. pay .. " $ maaşınızı aldınız.")
		
		if truckerLevel < 150 then
			MySQL.Sync.execute('update users set truckerLevel = @truckerLevel where identifier = @identifier', {['@identifier'] = identifier, ['@truckerLevel'] = truckerLevel + 1})
		end
		
		truckerLevel = truckerLevel + 1
		if truckerLevel >= 0 and truckerLevel < 25 then			
			TriggerClientEvent('chatMessage', xPlayer.source, "", {255, 255, 255}, "Kamyonculuk leveliniz 1, 2. levele ulaşmak için " .. 25 - truckerLevel .. " defa gidip gelmeniz gerekiyor.")
		elseif truckerLevel >= 25 and truckerLevel < 75 then
			TriggerClientEvent('chatMessage', xPlayer.source, "", {255, 255, 255}, "Kamyonculuk leveliniz 2, 3. levele ulaşmak için " .. 75 - truckerLevel .. " defa gidip gelmeniz gerekiyor.")
		elseif truckerLevel >= 75 and truckerLevel < 150 then
			TriggerClientEvent('chatMessage', xPlayer.source, "", {255, 255, 255}, "Kamyonculuk leveliniz 3, 4. levele ulaşmak için " .. 150 - truckerLevel .. " defa gidip gelmeniz gerekiyor.")
		end
	end)
end)


RegisterServerEvent('esx_builder:canPay')
AddEventHandler('esx_builder:canPay', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(Config.BuilderPrice)
	TriggerClientEvent('esx:showNotification', xPlayer.source, Config.BuilderPrice .. "$ maaşınızı aldınız.")
end)

ESX.RegisterServerCallback('esx_trashmaster:canPay', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getMoney()
	local pay = Config.TrasherCarPrice
	
	if money < pay then
		cb(false)
	else
		xPlayer.removeMoney(pay)
		cb(true)
	end
end)


RegisterServerEvent('esx_trasher:confirmPay')
AddEventHandler('esx_trasher:confirmPay', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(Config.TrasherPay)
	TriggerClientEvent('esx:showNotification', xPlayer.source, 'Görevi tamamladınız ve ' .. Config.TrasherPay .. '$ paranızı aldınız.')
end)



