SCHEMA.name = "Dissolution"
SCHEMA.author = "Chessnut"
SCHEMA.desc = "Society is a thing of the past."
SCHEMA.uniqueID = "dissolution"

nut.currency.SetUp("scrap", "scraps")

nut.config.menuMusic = "music/hl1_song24.mp3"
nut.config.bigIntroText = SCHEMA.name
nut.config.smallIntroText = SCHEMA.desc
nut.config.mainColor = Color(100, 130, 70)

nut.util.Include("sv_schema.lua")
nut.util.Include("cl_hooks.lua")
nut.util.Include("sh_commands.lua")