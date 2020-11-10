--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
skD = {}
Tunnel.bindInterface("cartel_coca",skD)

local drugs = ""

function SkidLogs(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


function skD.colherFolha()
	local source = source
	local user_id = vRP.getUserId(source)
	local random = math.random(15,20)
	if user_id then
		if vRP.hasPermission(user_id,"cartel.geral") then
			vRP.giveInventoryItem(user_id,"folhadecoca",parseInt(random))
		end
	end		
end


function skD.production(qtdleaf,qtdgas,qtdacid)
	local source = source
	local user_id = vRP.getUserId(source)
	--proporção certa 20 folhas x 5 Gasolina (ou 10 Querosene) x 2 ácido
	if user_id then		
		if vRP.getInventoryItemAmount(user_id,"folhadecoca") < parseInt(qtdleaf)	then
			TriggerClientEvent("Notify",source,"Você não possui Folha de Coca suficientes.","Impossível","Vermelho")
			return
		elseif vRP.getInventoryItemAmount(user_id,"gasolina") < parseInt(qtdgas) then
			TriggerClientEvent("Notify",source,"Você não possui Gasolina suficiente.","Impossível","Vermelho")
			return
		elseif vRP.getInventoryItemAmount(user_id,"acidosulf") < parseInt(qtdacid) then
			TriggerClientEvent("Notify",source,"Você não possui Ácido suficientes.","Impossível","Vermelho")
			return
		elseif parseInt(qtdleaf) > 100 then
			TriggerClientEvent("Notify",source,"Número máximo de folhas por produção.","Impossível","Vermelho")
		else
			local div = parseInt(qtdleaf)/parseInt(qtdgas)
			if parseInt(div) == 4 and parseInt(qtdacid) == 2 then
				local amount = parseInt((qtdleaf)*0,1)
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabasehq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then
								if parseInt(amount) < 1 then
									amount = 1
								end
								prod("pastabasehq",parseInt(amount*3),parseInt(15000))						
							end
						end	
					end
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")
				end		
			elseif parseInt(div) <= 4 and parseInt(qtdacid) > 2 and parseInt(qtdacid) < 5 then
				local amount = parseInt((qtdleaf)*0,1)
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabasemq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then						
								if parseInt(amount) < 1 then
									amount = 1
								end
								if parseInt(math.random(100)) >= 86
									prod("pastabasemq",parseInt(amount*4),parseInt(15000))
								else
									prod("pastabasehq",parseInt(amount*3),parseInt(15000))
								end	
							end			
						end
					end	
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")	
				end	
			elseif parseInt(div) >= 4 and parseInt(qtdacid) > 5 then
				local amount = parseInt((qtdleaf)*0,1)
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabasemq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then
								if parseInt(amount) < 1 then
									amount = 1
								end
								if parseInt(math.random(100)) >= 95
									prod("pastabasemq",parseInt(amount*3),parseInt(15000))
								else
									prod("pastabasehq",parseInt(amount*5),parseInt(15000))
								end	
							end	
						end
					end	
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")	
				end	
			elseif parseInt(div) > 5 and parseInt(qtdacid) < 2 then
				local amount = parseInt((qtdleaf)*0,1)
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabasemq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then
								if parseInt(amount) < 1 then
									amount = 1
								end	
								if parseInt(math.random(100)) >= 90
									prod("pastabasemq",parseInt(amount*6),parseInt(15000))		
								else
									prod("pastabasehq",parseInt(amount*5),parseInt(15000))
								end										
							end	
						end
					end	
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")	
				end	
			elseif parseInt(div) > 5 and parseInt(qtdacid) > 3 then	
				local amount = parseInt((qtdleaf)*0,1)
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabasemq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then							
								if parseInt(amount) < 1 then
									amount = 1
								end								
								if parseInt(math.random(100)) >= 90
									prod("pastabaselq",parseInt(amount*5),parseInt(15000))	
								else
									prod("pastabasemq",parseInt(amount*3),parseInt(15000))	
								end													
							end	
						end
					end	
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")	
				end	
			elseif parseInt(div) < 4 and parseInt(qtdacid) > 3 then	
				local amount = parseInt((qtdleaf)*0,1)			
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabaselq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then	
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then
								if parseInt(amount) < 1 then
									amount = 1
								end
								if parseInt(math.random(100)) >= 97
								prod("pastabaselq",parseInt(amount*5),parseInt(15000))	
							else
								prod("pastabasehq",parseInt(amount*2),parseInt(15000))	
							end	
							end	
						end
					end	
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")	
				end			
			elseif parseInt(div) < 4 and parseInt(qtdacid) < 3 then	
				local amount = parseInt((qtdleaf)*0,1)
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabaselq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then	
					if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
						if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
							if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pastabaselq")*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then	
									if parseInt(amount) < 1 then
										amount = 1
									end
									if parseInt(math.random(100)) >= 90
										prod("pastabaselq",parseInt(amount*5),parseInt(15000))	
									else
										prod("pastabasemq",parseInt(amount*3),parseInt(15000))	
									end						
								end	
							end
						end	
					end	
				else
					TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")	
				end	
			else
				if vRP.tryGetInventoryItem(user_id,"folhadecoca",parseInt(qtdleaf)) then
					if vRP.tryGetInventoryItem(user_id,"gasolina",parseInt(qtdgas)) then
						if vRP.tryGetInventoryItem(user_id,"acidosulf",parseInt(qtdacid)) then
							TriggerClientEvent("Notify",source,"Você errou na quantidade e se F#$%@.","Perdeu seus ingredientes","Vermelho")
						end
					end
				end		
			end				
		end
	end	
end	


function skD.brickCoke()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then	
		if vRP.getInventoryItemAmount(user_id,"pastabasehq") >= 1 then
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("brickcokehq") <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(user_id,"pastabasehq",1) then
					prod("brickcokehq",1,20000)
				end	
			else
				TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")
			end	
		elseif vRP.getInventoryItemAmount(user_id,"pastabasemq") >= 1 then		
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("brickcokemq") <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(user_id,"pastabasemq",1) then
					prod("brickcokemq",1,20000)
				end	
			else
				TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")
			end	
		elseif vRP.getInventoryItemAmount(user_id,"pastabaselq") >= 1 then	
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("brickcokelq") <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(user_id,"pastabaselq",1) then
					prod("brickcokelq",1,20000)
				end	
			else
				TriggerClientEvent("Notify",source,"Você não possui espaço no inventário.","Impossível","Vermelho")
			end	
		else
			TriggerClientEvent("Notify",source,"Você não possui nenhuma pasta base com você.","Impossível","Vermelho")
		end	
	end
end		


function skD.checkPerm()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"cartel.geral") or vRP.hasPermission(user_id,"admin.permissao")
end


function prod(item,amount,time)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		TriggerClientEvent("coca:closeNui",source)
		vRPclient._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
		TriggerClientEvent("Progress",source,parseInt(time))
		SetTimeout(parseInt(time),function()								
			vRP.giveInventoryItem(user_id,item,parseInt(amount))	
			vRPclient._stopAnim(source,false)	
			TriggerClientEvent("Notify",source,"Produziu "..parseInt(amount).."x "..vRP.itemNameList(item)..".","Concluído","Verde")
			SkidLogs(drugs,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PRODUZIU]: "..vRP.itemNameList(item).."("..item..")\n[QUANTIDADE]: "..parseInt(amount)..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end)
	end
end		
