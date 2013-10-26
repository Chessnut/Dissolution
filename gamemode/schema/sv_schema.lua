-- Add the content pack to the WorkshopDL.
resource.AddWorkshop("182104437")

-- How often zombies should POSSIBLY spawn in seconds.
local ZOMBIE_SPAWN_DELAY = 120

-- How many zombies there can be spawned in the map.
local ZOMBIE_MAX_COUNT = 50

SCHEMA.zombies = SCHEMA.zombies or {}
SCHEMA.zombieData = SCHEMA.zombieData or {}

function SCHEMA:SaveData()
	nut.util.WriteTable("zombies", self.zombieData)
end

function SCHEMA:LoadData()
	self.zombieData = nut.util.ReadTable("zombies") or {}
end

function SCHEMA:AddZombieSpawn(position)
	self.zombieData[#self.zombieData + 1] = position
	self:SaveData()
end

function SCHEMA:RemoveZombieSpawn(position, radius)
	radius = radius or 128

	local i = 0

	for k, v in pairs(self.zombieData) do
		if (position:Distance(v) <= radius) then
			self.zombieData[k] = nil
			i = i + 1
		end
	end

	if (i > 0) then
		self:SaveData()
	end

	return i
end

timer.Create("nut_ZombieSpawner", ZOMBIE_SPAWN_DELAY, 0, function()
	local zombies = 0

	for k, v in pairs(SCHEMA.zombies) do
		if (IsValid(v)) then
			zombies = zombies + 1
		end
	end
	
	if (#SCHEMA.zombieData > 0 and zombies <= ZOMBIE_MAX_COUNT and math.random(1, 5) == 3) then
		local position = table.Random(SCHEMA.zombieData)
		local realPos = position + Vector(math.random(-256, 256), math.random(-256, 256), 75)
		local zombie = ents.Create("nut_zombie")
			zombie:SetPos(realPos)
			zombie:Spawn()
			zombie:Activate()
		SCHEMA.zombies[#SCHEMA.zombies + 1] = zombie
	end
end)