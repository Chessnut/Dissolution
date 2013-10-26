local PLUGIN = PLUGIN

nut.command.Register({
	adminOnly = true,
	syntax = "[number rarity]",
	onRun = function(client, arguments)
		local rarity = math.Clamp(tonumber(arguments[1] or "4") or 4, 2, 100)

		PLUGIN:AddArea(client:GetPos() + Vector(0, 0, 48), rarity)
		nut.util.Notify("You have added a new junk spawn.", client)
	end
}, "junkadd")

nut.command.Register({
	adminOnly = true,
	syntax = "[number radius]",
	onRun = function(client, arguments)
		local radius = tonumber(arguments[1] or "128") or 128
		local count = PLUGIN:RemoveArea(client:GetPos(), radius)

		nut.util.Notify("You have removed "..count.." junk spawn(s).", client)
	end
}, "junkremove")