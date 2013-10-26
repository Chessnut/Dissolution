-- Modify the color correction to give a more faded, green color.
function SCHEMA:ModifyColorCorrection(color)
	color["$pp_colour_brightness"] = -0.075
	color["$pp_colour_contrast"] = 1.2
	color["$pp_colour_addr"] = 0.03
	color["$pp_colour_addg"] = 0.05
	color["$pp_colour_colour"] = 0.25
	color["$pp_colour_addb"] = 0
	color["$pp_colour_mulr"] = 0
	color["$pp_colour_mulg"] = 0.1
	color["$pp_colour_mulb"] = 0
end

-- Add a little bloom to simulate extra brightness outside.
function SCHEMA:RenderScreenspaceEffects()
	DrawBloom(0.45, 0.4, 50, 5, 3, 2, 0.35, 0.3, 0.05)
end