nut.command.Register({
	adminOnly = true,
	onRun = function(client, arguments)
		SCHEMA:AddZombieSpawn(client:GetPos())
		nut.util.Notify("You have added a new zombie spawn.", client)
	end
}, "zombieadd")

nut.command.Register({
	adminOnly = true,
	onRun = function(client, arguments)
		local radius = tonumber(arguments[1]) or 128
		local count = SCHEMA:RemoveZombieSpawn(client:GetPos(), radius)

		nut.util.Notify("You have removed "..count.." zombie spawn(s).", client)
	end
}, "zombieremove")