-- Give the faction a proper name for misc. use (such as the scoreboard)
FACTION.name = "National Guard"
-- A short description used as a tooltip for character creation.
FACTION.desc = "The protective force for survivors."
-- Give the faction a color visible in the scoreboard and OOC.
FACTION.color = Color(186, 56, 40)
-- Empty the male models so they will not use default male models.
FACTION.maleModels = {}
-- Empty the female models so they will not use default female models.
FACTION.femaleModels = {}
-- Define it as a whitelisted faction.
FACTION.isDefault = false
-- How often the faction gets paid in seconds.
FACTION.payTime = 10
-- How much the faction members gets paid.
FACTION.pay = 25

-- Add the 9 variants of male models.
for i = 1, 9 do
	-- Add the male model to the faction models.
	FACTION.maleModels[#FACTION.maleModels + 1] = Model("models/rusty/natguard/male_0"..i..".mdl")
end

-- Loop through the 7 model.
for i = 1, 7 do
	-- The female05 group does not exist, so skip it.
	if (i != 5) then
		-- Add that model to the faction models.
		FACTION.femaleModels[#FACTION.femaleModels + 1] = Model("models/army/female_0"..i..".mdl")
	end
end

-- Give a default ranking and allow the name to be changed.
function FACTION:GetDefaultName(panel)
	return "Pvt. John Doe", true
end

-- Set a global variable that represents the team ID.
FACTION_GUARD = FACTION.index