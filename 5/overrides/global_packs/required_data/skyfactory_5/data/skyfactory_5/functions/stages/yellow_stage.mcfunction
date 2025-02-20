gamestage add @s yellow
#Sets cloud, sun, and moon to green and disables sunrise colors
execute as @e[type=player,distance=..16] run colorfulskies disablesunrise @s true
execute as @e[type=player,distance=..16] run colorfulskies color @s cloud ffd83d
execute as @e[type=player,distance=..16] run colorfulskies color @s sun ffd83d
execute as @e[type=player,distance=..16] run colorfulskies color @s moon ffd83d
execute as @e[type=player,distance=..16] run colorfulskies color @s sunrise ffd83d
execute as @e[type=player,distance=..16] run colorfulskies color @s sky ffd83d

#execute as @e[type=player,distance=..16] run give @s sf5_things:green_apple
execute as @e[type=player,distance=..16] run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.35

title @s title {"text":"","color":"#D3B333"}
title @s subtitle [{"text":"Yellow","color":"#D3B333"},{"text":" Has Been Added to Your Palette","color":"#FFFFFF"}]

execute as @e[type=player,distance=..16] run tag @s add yellow_stage
