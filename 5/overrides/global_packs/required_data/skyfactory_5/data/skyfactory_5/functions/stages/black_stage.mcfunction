gamestage add @s black
#Sets cloud, sun, and moon to green and disables sunrise colors
execute as @e[type=player,distance=..16] run colorfulskies disablesunrise @s true
execute as @e[type=player,distance=..16] run colorfulskies color @s cloud 1d1c21
execute as @e[type=player,distance=..16] run colorfulskies color @s sun 1d1c21
execute as @e[type=player,distance=..16] run colorfulskies color @s moon 1d1c21
execute as @e[type=player,distance=..16] run colorfulskies color @s sunrise 1d1c21
execute as @e[type=player,distance=..16] run colorfulskies color @s sky 1d1c21


#execute as @e[type=player,distance=..16] run give @s sf5_things:green_apple
execute as @e[type=player,distance=..16] run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.35

title @s title {"text":"","color":"#37353F"}
title @s subtitle [{"text":"Black","color":"#37353F"},{"text":" Has Been Added to Your Palette","color":"#FFFFFF"}]

execute as @e[type=player,distance=..16] run tag @s add black_stage
