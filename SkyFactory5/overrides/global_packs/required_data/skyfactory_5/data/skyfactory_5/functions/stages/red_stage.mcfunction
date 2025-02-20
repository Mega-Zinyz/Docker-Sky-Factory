gamestage add @s red
#Sets cloud, sun, and moon to green and disables sunrise colors
execute as @e[type=player,distance=..16] run colorfulskies disablesunrise @s true
execute as @e[type=player,distance=..16] run colorfulskies color @s cloud b02e26
execute as @e[type=player,distance=..16] run colorfulskies color @s sun b02e26
execute as @e[type=player,distance=..16] run colorfulskies color @s moon b02e26
execute as @e[type=player,distance=..16] run colorfulskies color @s sunrise b02e26
execute as @e[type=player,distance=..16] run colorfulskies color @s sky b02e26

#execute as @e[type=player,distance=..16] run give @s sf5_things:green_apple
execute as @e[type=player,distance=..16] run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.35

title @s title {"text":"","color":"#8A2520"}
title @s subtitle [{"text":"Red","color":"#8A2520"},{"text":" Has Been Added to Your Palette","color":"#FFFFFF"}]

execute as @e[type=player,distance=..16] run tag @s add red_stage
