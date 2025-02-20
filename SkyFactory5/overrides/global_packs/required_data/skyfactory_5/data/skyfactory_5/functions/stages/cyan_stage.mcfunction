gamestage add @s cyan
#Sets cloud, sun, and moon to green and disables sunrise colors
execute as @e[type=player,distance=..16] run colorfulskies disablesunrise @s true
execute as @e[type=player,distance=..16] run colorfulskies color @s cloud 169c9d
execute as @e[type=player,distance=..16] run colorfulskies color @s sun 169c9d
execute as @e[type=player,distance=..16] run colorfulskies color @s moon 169c9d
execute as @e[type=player,distance=..16] run colorfulskies color @s sunrise 169c9d
execute as @e[type=player,distance=..16] run colorfulskies color @s sky 169c9d

execute as @e[type=player,distance=..16] run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.35

title @s title {"text":"","color":"#138585"}
title @s subtitle [{"text":"Cyan","color":"#138585"},{"text":" Has Been Added to Your Palette","color":"#FFFFFF"}]

execute as @e[type=player,distance=..16] run tag @s add cyan_stage
