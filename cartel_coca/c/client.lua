local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
skD = Tunnel.getInterface("cartel_coca",skD)



local step = 0
local started = 0
local use = 0
local colher = 0


local display = false
function ToggleActionMenu()
	SetDisplay(not display)
end

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool,bool)
    SendNUIMessage({  --envia informações para o javascript, no caso Message
        type = "ui",
        status = bool
    })
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COLHER
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

local estufas = {
    {1931.06,4862.22,47.20,"ESTUFA 1"}, -- estufa 1
    {1901.65,4891.15,47.57,"ESTUFA 1"}, -- estufa 1
    {1936.04,4866.99,46.94,"ESTUFA 2"}, -- estufa 2
    {1906.16,4895.92,48.02,"ESTUFA 2"}, -- estufa 1
    {1942.71,4873.08,46.54,"ESTUFA 3"}, -- estufa 3
    {1912.89,4902.47,48.11,"ESTUFA 3"}, -- estufa 3
    {1950.06,4881.22,46.02,"ESTUFA 4"}, -- estufa 4
    {1920.80,4910.67,48.09,"ESTUFA 4"}, -- estufa 4
    {1954.63,4886.23,45.77,"ESTUFA 5"}, -- estufa 5
    {1925.02,4915.49,47.63,"ESTUFA 5"}, -- estufa 5
    {1958.11,4891.37,45.24,"ESTUFA 6"}, -- estufa 6
    {1929.72,4919.65,47.42,"ESTUFA 6"}, -- estufa 6
    
    
}
local posicoes = {
-- estufa 1 [ 8 ]
    {1928.46,4864.48,47.24},
    {1927.29,4865.71,47.20},
    {1926.29,4866.69,47.17},
    {1924.41,4868.71,47.13},
    {1908.17,4884.52,47.25},
    {1907.14,4885.58,47.28},
    {1905.51,4887.03,47.36},
    {1904.02,4888.55,47.45},
    -- 8
-- estufa 2 [ 8 ]
    {1933.0435791016,4869.1381835938,47.111061096191},
    {1932.1163330078,4870.0610351563,47.099105834961},
    {1930.8226318359,4871.38671875,47.081764221191},
    {1928.8562011719,4873.45703125,47.075748443604},
    {1912.8137207031,4889.2954101563,47.596221923828},
    {1911.7214355469,4890.3549804688,47.655612945557},
    {1910.4632568359,4891.5737304688,47.714317321777},
    {1908.8903808594,4893.0986328125,47.787322998047},
    -- 16
-- estufa 3 [ 4 ]
    {1916.55,4898.57,47.77},
    {1914.45,4900.62,47.96},
    {1917.69,4897.45,47.67},
    {1918.76,4896.37,47.57},
    -- 20
-- estufa 4 [ 8 ]
    {1922.8292236328,4908.18359375,47.88410949707},
    {1924.912109375,4906.0771484375,47.705718994141},
    {1925.7841796875,4905.1323242188,47.611980438232},
    {1926.9937744141,4903.8715820313,47.47492980957},
    {1941.021484375,4889.8203125,46.275196075439},
    {1942.7159423828,4888.1337890625,46.230117797852},
    {1944.2045898438,4886.6899414063,46.192138671875},
    {1945.3428955078,4885.5708007813,46.165458679199},
    -- 28
-- estufa 5 [ 4 ]
    {1950.2022705078,4889.78125,45.703556060791},
    {1949.3500976563,4890.6411132813,45.707141876221},
    {1948.0155029297,4892.0205078125,45.708435058594},
    {1946.1467285156,4893.9501953125,45.750034332275},
    -- 32
-- estufa 6 [ 6 ]
    {1938.6608886719,4910.6274414063,46.162059783936},
    {1940.5964355469,4908.65234375,45.924896240234},
    {1942.7100830078,4906.5234375,45.769744873047},
    {1948.5727539063,4901.01171875,45.417064666748},
    {1950.3703613281,4899.1533203125,45.350521087646},
    {1952.6193847656,4896.8764648438,45.3154296875},
    -- 38
}

local l = math.random(1,38)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        if colher == 0 then
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1899.79,4925.15,48.81, true) <= 1.0 then    
                DrawText3Ds(1899.79,4925.15,48.81+0.5,"PRESSIONE ~r~E~w~ PARA COMEÇAR A TRABALHAR")
                if IsControlJustPressed(0, 38) and skD.checkPerm() then     
                    colher = 1 
                    TriggerEvent("Notify","Você entrou em serviço.","Vá trabalhar","Verde")                 
                end
            end     
        end

        local ui = GetMinimapAnchor()                   
        if colher == 1 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.046,1.0,1.0,0.35,"PRESSIONE ~r~INSERT ~w~PARA CANCELAR A MISSÃO",255,255,255,150)
            if l <= 8 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.028,1.0,1.0,0.45,"VÁ ATÉ A ~g~ESTUFA 1~w~ PARA COLHER",255,255,255,255)
            elseif l >= 9 and l <= 16 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.028,1.0,1.0,0.45,"VÁ ATÉ A ~g~ESTUFA 2~w~ PARA COLHER",255,255,255,255)
            elseif l >= 17 and l <= 20 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.028,1.0,1.0,0.45,"VÁ ATÉ A ~g~ESTUFA 3~w~ PARA COLHER",255,255,255,255)
            elseif l >= 21 and l <= 28 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.028,1.0,1.0,0.45,"VÁ ATÉ A ~g~ESTUFA 4~w~ PARA COLHER",255,255,255,255)
            elseif l >= 29 and l <= 32 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.028,1.0,1.0,0.45,"VÁ ATÉ A ~g~ESTUFA 5~w~ PARA COLHER",255,255,255,255)
            elseif l >= 33 and l <= 38 then
                drawTxt(ui.right_x+0.0310,ui.bottom_y-0.028,1.0,1.0,0.45,"VÁ ATÉ A ~g~ESTUFA 6~w~ PARA COLHER",255,255,255,255)
            end
        end
        for _,v in pairs(estufas) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v[1],v[2],v[3], true) <= 1.5 then   
                DrawText3Ds(v[1],v[2],v[3]+0.5,v[4])
            end
        end
        DrawMarker(23, posicoes[l][1],posicoes[l][2],posicoes[l][3]-0.9701, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 13, 232, 255, 50, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), posicoes[l][1],posicoes[l][2],posicoes[l][3], true) <= 1.0 then 
            DrawText3Ds(posicoes[l][1],posicoes[l][2],posicoes[l][3]+0.5,"PRESSIONE ~r~E~w~ PARA COLHER A PLANTAÇÃO")
            if IsControlJustPressed(0, 38) then     
                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                TriggerEvent("Progress",10000)    
                Citizen.Wait(10000)
                skD.colherFolha()
                ClearPedTasksImmediately(PlayerPedId())
                l = math.random(1,38)
            end
        end  
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(0,121) then
            if skD.checkPerm() then
                colher = 0     
                TriggerEvent("Notify","Você saiu de serviço.","Não poderá mais colher","Vermelho")
            end    
        end
    end
end)



-----------------------------------------------------------------------------------------------------
--LIGAR MAQUINÁRIO
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if started == 0 then
            if Vdist(x,y,z,-526.97,-1797.08,21.61) <= 4 then
                DrawMarker(23,-526.97,-1797.08,21.615-0.95,0,0,0,0,0,0,1.0,1.0,0.5,77,0,75,30,0,0,0,0)
                if Vdist(x,y,z,-526.97,-1797.08,21.61) <= 1.2 then
                    DrawText3Ds(-526.97,-1797.08,21.61+0.5,"PRESSIONE ~r~E~w~ PARA LIGAR MAQUINA")
                    if IsControlJustPressed(0,38) and skD.checkPerm() then
                        TriggerEvent("Progress",15000)
                        Citizen.Wait(15000)
                        step = 1   
                        started = 1
                        TriggerEvent("Notify","Você ligou o maquinário.","Vá refinar","Verde")
                    end
                end
            end
        end        
	end
end)

local producoes = {
	{ ['id'] = 1,['x'] = -534.15, ['y'] = -1794.17, ['z'] = 21.61, ['h'] = 146.00 },
    { ['id'] = 2,['x'] = -536.14, ['y'] = -1793.05, ['z'] = 21.61, ['h'] = 146.00 },
    { ['id'] = 3,['x'] = -538.48, ['y'] = -1791.7, ['z'] = 21.61, ['h'] = 146.00 }
}


Citizen.CreateThread(function()
    while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        for k,v in pairs(producoes) do
            if started >= 1 then              
                if Vdist(x,y,z,v.x,v.y,v.z) <= 3 then
                    DrawMarker(23,v.x,v.y,v.z-0.95,0,0,0,0,0,0,1.0,1.0,0.5,77,0,75,30,0,0,0,0)
                    if Vdist(x,y,z,v.x,v.y,v.z) <= 1.2 then
                        if started == 1 then
                            DrawText3Ds(v.x,v.y,v.z+0.5,"PRESSIONE ~r~E~w~ PROCESSOS QUÍMICOS")
                            if IsControlJustPressed(0,38) and skD.checkPerm()  then
                                step = 2
                                ToggleActionMenu()
                            end 
                        end     
                    end
                end
            end
        end        
	end
end)



-----------------------------------------------------------------------------------------------------
-- SECAR PASTA BASE
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if started == 1 and step >= 1 then
            if Vdist(x,y,z,-532.82,-1799.81,21.61) <= 4 then
                DrawMarker(23,-532.82,-1799.81,21.61-0.95,0,0,0,0,0,0,1.0,1.0,0.5,77,0,75,30,0,0,0,0)
                if Vdist(x,y,z,-532.82,-1799.81,21.61) <= 1.2 then
                    DrawText3Ds(-532.82,-1799.81,21.61+0.5,"PRESSIONE ~r~E~w~ PARA SECAR PASTA BASE")
                    if IsControlJustPressed(0,38) and skD.checkPerm()  then
                        skD.brickCoke()
                    end
                end
            end
        end        
	end
end)

-----------------------------------------------------------------------------------------------------
--DESLIGAR MAQUINÁRIO
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if started == 1 then
            if Vdist(x,y,z,-528.95,-1801.01,21.61) <= 4 then
                DrawMarker(23,-528.95,-1801.01,21.61-0.95,0,0,0,0,0,0,1.0,1.0,0.5,77,0,75,30,0,0,0,0)
                if Vdist(x,y,z,-528.95,-1801.01,21.61) <= 1.2 then
                    DrawText3Ds(-528.95,-1801.01,21.61+0.5,"PRESSIONE ~r~E~w~ PARA DESLIGAR MAQUINÁRIO")
                    if IsControlJustPressed(0,38) and skD.checkPerm()  then
                        step = 0
                        started = 0                     
                        TriggerEvent("Notify","Você desligou o maquinário","Não poderá mais refinar","Vermelho")
                    end
                end
            end
        end        
	end
end)


-----------------------------------------------------------------------------------------------------
--AVISO DE MAQUINÁRIO
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if step == 1 and started == 1 then
            if Vdist(x,y,z,-526.97,-1797.08,21.61) <= 2 then
                DrawText3Ds(-526.97,-1797.08,21.61+0.5,"MAQUINA ATIVADA")
            end
        end    
    end
end)






RegisterCommand('dorgas', function()
    ToggleActionMenu()
end)


RegisterNUICallback('fechar',function()
	SetDisplay(false)
end)

RegisterNUICallback('fail', function(data) --regista o call back do JS
    TriggerEvent("Notify",data.msg,"Você está errando nos ingredientes","Vermelho")
end)

RegisterNUICallback('production', function(data)
    skD.production(data.qtdleaf,data.qtdgas,data.qtdacid)
end)


RegisterNetEvent("coca:closeNui")
AddEventHandler("coca:closeNui",function()
    SetDisplay(false)
end)    



function drawTxt(x,y,width,height,scale,text,r,g,b,a)
    SetTextFont(4)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end