PLUGIN.name = "Junk Items"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Adds items that can be sold for some some change."
PLUGIN.entities = PLUGIN.entities or {}
PLUGIN.areas = PLUGIN.areas or {}

-- The maximum number of junk on a map.
-- The higher the number, the more items there will be which could
-- cause more lag.
PLUGIN.items = 30

-- How often junk items should POSSIBLY spawn in seconds.
PLUGIN.interval = 180

function PLUGIN:ItemShouldSave(entity)
	if (self.entities[entity]) then
		return false
	end
end

function PLUGIN:ItemRestored(itemTable, entity)
	if (itemTable.isJunk) then
		self.entities[entity] = true
	end
end

function PLUGIN:SpawnJunk()
	local entities = 0

	for k, v in pairs(self.entities) do
		if (IsValid(k)) then
			entities = entities + 1
		end
	end

	if (self.items > 0 and entities < self.items) then
		if (#self.areas < 1) then
			return
		end

		local area = table.Random(self.areas)

		if (math.random(1, math.max(area.odds, 2)) == math.random(1, math.max(area.odds, 2))) then
			local items = {}
				for k, v in pairs(nut.item.GetAll()) do
					if (v.isJunk) then
						items[k] = v
					end
				end
			local itemTable = table.Random(items)
			local entity = nut.item.Spawn(area.pos + Vector(math.random(-256, 256), math.random(-256, 256), 75), nil, itemTable)

			self.entities[entity] = entity
		end
	end
end

function PLUGIN:LoadData()
	self.areas = self:ReadTable()
end

function PLUGIN:SaveData()
	self:WriteTable(self.areas)
end

function PLUGIN:AddArea(position, rarity)
	rarity = rarity or 4

	self.areas[#self.areas + 1] = {pos = position, odds = rarity}
	self:SaveData()
end

function PLUGIN:RemoveArea(position, radius)
	radius = radius or 128

	local i = 0

	for k, v in pairs(self.areas) do
		if (position:Distance(v.pos) <= radius) then
			self.areas[k] = nil
			i = i + 1
		end
	end

	if (i > 0) then
		self:SaveData()
	end

	return i
end

local PLUGIN = PLUGIN

nut.util.Include("sh_commands.lua")

timer.Create("nut_SpawnJunk", PLUGIN.interval, 0, function()
	PLUGIN:SpawnJunk()
end)