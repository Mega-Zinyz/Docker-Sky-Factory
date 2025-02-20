gamestage add @s green
#Sets cloud, sun, and moon to green and disables sunrise colors
execute as @e[type=player,distance=..16] run colorfulskies disablesunrise @s true
execute as @e[type=player,distance=..16] run colorfulskies color @s cloud 5d7c15
execute as @e[type=player,distance=..16] run colorfulskies color @s sun 5d7c15
execute as @e[type=player,distance=..16] run colorfulskies color @s moon 5d7c15
execute as @e[type=player,distance=..16] run colorfulskies color @s sunrise 5d7c15
execute as @e[type=player,distance=..16] run colorfulskies color @s sky 5d7c15

execute as @e[type=player,distance=..16] run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.35

title @s title {"text":"","color":"#496111"}
title @s subtitle [{"text":"Green","color":"#496111"},{"text":" Has Been Added to Your Palette","color":"#FFFFFF"}]

execute as @e[type=player,distance=..16] run tag @s add green_stage
