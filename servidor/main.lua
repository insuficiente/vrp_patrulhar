local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Config = module("vrp_patrulhar", "config")

cnVRP = {}
Tunnel.bindInterface("vrp_patrulhar", cnVRP)

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterCommand('patrulhar', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)

	if vRP.hasPermission(user_id, Config.Pm_Perm) or vRP.hasPermission(user_id, Config.Adm_Perm) then
	else
		TriggerClientEvent("Notify", source, "negado", "Infelizmente você não tem permissão para executar este comando! 😥")
		vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
	end
end)