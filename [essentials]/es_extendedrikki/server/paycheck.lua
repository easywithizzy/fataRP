ESX.StartPayCheck = function()

	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local job     = xPlayer.job.grade_name
			local salary  = xPlayer.job.grade_salary

			if salary > 0 then
				if job == 'unemployed' then -- unemployed
					xPlayer.addAccountMoney('bank:transfer', salary)
					TriggerClientEvent('tac:showAdvancedNotification', xPlayer.source, _U('bank:transfer'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_bank:transfer_MAZE', 9)
				elseif Config.EnableSocietyPayouts then -- possibly a society
					TriggerEvent('tac_society:getSociety', xPlayer.job.name, function (society)
						if society ~= nil then -- verified society
							TriggerEvent('tac_addonaccount:getSharedAccount', society.account, function (account)
								if account.money >= salary then -- does the society money to pay its employees?
									xPlayer.addAccountMoney('bank:transfer', salary)
									account.removeMoney(salary)
	
									TriggerClientEvent('tac:showAdvancedNotification', xPlayer.source, _U('bank:transfer'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_bank:transfer_MAZE', 9)
								else
									TriggerClientEvent('tac:showAdvancedNotification', xPlayer.source, _U('bank:transfer'), '', _U('company_nomoney'), 'CHAR_bank:transfer_MAZE', 1)
								end
							end)
						else -- not a society
							xPlayer.addAccountMoney('bank:transfer', salary)
							TriggerClientEvent('tac:showAdvancedNotification', xPlayer.source, _U('bank:transfer'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_bank:transfer_MAZE', 9)
						end
					end)
				else -- generic job
					xPlayer.addAccountMoney('bank:transfer', salary)
					TriggerClientEvent('tac:showAdvancedNotification', xPlayer.source, _U('bank:transfer'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_bank:transfer_MAZE', 9)
				end
			end

		end

		SetTimeout(Config.PaycheckInterval, payCheck)

	end

	SetTimeout(Config.PaycheckInterval, payCheck)

end
