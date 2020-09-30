--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:transfer:deposit')
AddEventHandler('bank:transfer:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid amount." })
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank:transfer', tonumber(amount))
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "You have successfully deposited $" .. amount .. ""})
	end
end)


RegisterServerEvent('bank:transfer:withdraw')
AddEventHandler('bank:transfer:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank:transfer').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid amount." })
	else
		xPlayer.removeAccountMoney('bank:transfer', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "You have successfully withdrawn $".. amount .. ""})
	end
end)

RegisterServerEvent('bank:transfer:balance')
AddEventHandler('bank:transfer:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank:transfer').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)


RegisterServerEvent('bank:transfer:transfer')
AddEventHandler('bank:transfer:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0
	balance = xPlayer.getAccount('bank:transfer').money
	zbalance = xPlayer.getAccount('bank:transfer').money
	
	if tonumber(_source) == tonumber(to) then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "You cannot transfer funds to yourself." })
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid amount." })
		else
			xPlayer.removeAccountMoney('bank:transfer', amountt)
			zPlayer.addAccountMoney('bank:transfer', amountt)
			-- advanced notification with bank:transfer icon
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "You have transfered $".. amountt .. " to " .. to .. "."})
			TriggerClientEvent('mythic_notify:client:SendAlert', to, { type = 'inform', text = "You have received $" .. amountt .. " from " .. _source .. "." })
		end
		
	end
end)

RegisterCommand('cash', function(source, args, rawCommand)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    cash = xPlayer.getMoney()
    TriggerClientEvent('st-bank:transfering:updateCash', source, cash)
end)

RegisterCommand('bank:transfer', function(source, args, rawCommand)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    bank:transfer = xPlayer.getAccount('bank:transfer').money
    TriggerClientEvent('st-bank:transfering:updatebank:transfer', source, bank:transfer)
end)



