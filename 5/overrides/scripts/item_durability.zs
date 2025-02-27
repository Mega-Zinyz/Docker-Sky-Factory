import crafttweaker.api.item.IItemStack;
  // Sets item durability

val modIDsForDurability as string[][int] = {
  -1: [],
  9999: [],
  2147483647: [],
  2147483648: [],
  999999999999: []
};

for durability, modIDs in modIDsForDurability {
  for modID in modIDs {
    for item in loadedMods[modID].getItems() {
      item.getDefaultInstance().maxDamage = durability;
    }
  }
}

val itemsForDurability as IItemStack[][int] = {
  -1: [],
  9999: [],
  2147483647: [
    <item:create:super_glue>,
    <item:sophisticatedstorage:packing_tape>,
    <item:supplementaries:soap>,
    <item:create:sand_paper>
    ]
};

for durability, items in itemsForDurability{
  for item in items {
      item.maxDamage = durability;
  }
}

  // //
  // Sets up items to use the Unbreakable tag as this is a much cleaner
  // method for many items rather than setting durability
  // //

val itemsForUnbreakable = [
  // items go here
  // Create
  <resource:create:copper_diving_boots>,
  <resource:create:copper_diving_helmet>,
  <resource:create:netherite_diving_boots>,
  <resource:create:netherite_diving_helmet>,

  // Cyclic
  <resource:cyclic:charm_antidote>,
  <resource:cyclic:charm_antipotion>,
  <resource:cyclic:charm_attack_speed>,
  <resource:cyclic:charm_boostpotion>,
  <resource:cyclic:charm_creeper>,
  <resource:cyclic:charm_crit>,
  <resource:cyclic:charm_fire>,
  <resource:cyclic:charm_home>,
  <resource:cyclic:charm_invisible>,
  <resource:cyclic:charm_knockback_resistance>,
  <resource:cyclic:charm_longfall>,
  <resource:cyclic:charm_luck>,
  <resource:cyclic:charm_magicdefense>,
  <resource:cyclic:charm_speed>,
  <resource:cyclic:charm_starvation>,
  <resource:cyclic:charm_stealthpotion>,
  <resource:cyclic:charm_stone>,
  <resource:cyclic:charm_ultimate>,
  <resource:cyclic:charm_venom>,
  <resource:cyclic:charm_void>,
  <resource:cyclic:charm_water>,
  <resource:cyclic:charm_wither>,
  <resource:cyclic:charm_world>,
  <resource:cyclic:charm_xp_blocker>,
  <resource:cyclic:charm_xp_speed>,
  <resource:cyclic:charm_wing>,
  <resource:cyclic:antigravity>,
  <resource:cyclic:antimatter_wand>,
  <resource:cyclic:boomerang_carry>,
  <resource:cyclic:boomerang_damage>,
  <resource:cyclic:boomerang_stun>,
  <resource:cyclic:build_scepter>,
  <resource:cyclic:cable_wrench>,
  <resource:cyclic:elevation_wand>,
  <resource:cyclic:ender_book>,
  <resource:cyclic:ender_pearl_mounted>,
  <resource:cyclic:ender_pearl_reuse>,
  <resource:cyclic:evoker_fang>,
  <resource:cyclic:fire_killer>,
  <resource:cyclic:fire_scepter>,
  <resource:cyclic:flippers>,
  <resource:cyclic:flute_summoning>,
  <resource:cyclic:glove_climb>,
  <resource:cyclic:glowing_helmet>,
  <resource:cyclic:ice_scepter>,
  <resource:cyclic:lightning_scepter>,
  <resource:cyclic:offset_scepter>,
  <resource:cyclic:prospector>,
  <resource:cyclic:quiver_damage>,
  <resource:cyclic:quiver_lightning>,
  <resource:cyclic:randomize_scepter>,
  <resource:cyclic:replace_scepter>,
  <resource:cyclic:rotation_wand>,
  <resource:cyclic:scythe_brush>,
  <resource:cyclic:scythe_forage>,
  <resource:cyclic:scythe_harvest>,
  <resource:cyclic:scythe_leaves>,
  <resource:cyclic:slingshot>,
  <resource:cyclic:spawn_inspector>,
  <resource:cyclic:spell_ice>,
  <resource:cyclic:spell_water>,
  <resource:cyclic:stirrups>,
  <resource:cyclic:stirrups_reverse>,
  <resource:cyclic:teleport_wand>,
  <resource:cyclic:torch_launcher>,
  <resource:cyclic:ender_fishing>,

  // EnderIO
  <resource:enderio:dark_steel_sword>,

  // Pizzacraft
  <resource:pizzacraft:stone_pizza_peel>,
  <resource:pizzacraft:iron_pizza_peel>,
  <resource:pizzacraft:golden_pizza_peel>,
  <resource:pizzacraft:diamond_pizza_peel>,
  <resource:pizzacraft:netherite_pizza_peel>,
  <resource:pizzacraft:chef_hat>,
  <resource:pizzacraft:chef_shirt>,
  <resource:pizzacraft:chef_leggings>,
  <resource:pizzacraft:chef_boots>,
  <resource:pizzacraft:pizza_delivery_cap>,
  <resource:pizzacraft:pizza_delivery_shirt>,
  <resource:pizzacraft:pizza_delivery_leggings>,
  <resource:pizzacraft:pizza_delivery_boots>,
  <resource:pizzacraft:red_pizza_bag>,
  <resource:pizzacraft:stone_knife>,
  <resource:pizzacraft:golden_knife>,
  <resource:pizzacraft:iron_knife>,
  <resource:pizzacraft:diamond_knife>,
  <resource:pizzacraft:netherite_knife>,
  <resource:pizzacraft:rolling_pin>,

  // Vinery
  <resource:vinery:straw_hat>,
  <resource:vinery:straw_hat>,
  <resource:vinery:winemaker_apron>,
  <resource:vinery:winemaker_boots>,
  <resource:vinery:winemaker_leggings>,

  // Immersive Engineering
  <resource:immersiveengineering:wirecutter>,
  <resource:immersiveengineering:hammer>,
  <resource:immersiveengineering:screwdriver>,
  <resource:immersiveengineering:armor_faraday_helmet>,
  <resource:immersiveengineering:armor_faraday_chestplate>,
  <resource:immersiveengineering:armor_faraday_leggings>,
  <resource:immersiveengineering:armor_faraday_boots>,

  // Modular Golems
  <resource:modulargolems:roman_guard_helmet>,
  <resource:modulargolems:roman_guard_chestplate>,
  <resource:modulargolems:roman_guard_shinguard>,
  <resource:modulargolems:wind_spirit_helmet>,
  <resource:modulargolems:wind_spirit_chestplate>,
  <resource:modulargolems:wind_spirit_shinguard>,
  <resource:modulargolems:wind_spirit_shinguard>,
  <resource:modulargolems:wind_spirit_shinguard>,
  <resource:modulargolems:barbaric_vanguard_helmet>,
  <resource:modulargolems:barbaric_vanguard_chestplate>,
  <resource:modulargolems:barbaric_vanguard_shinguard>,
  <resource:modulargolems:iron_golem_spear>,
  <resource:modulargolems:diamond_golem_spear>,
  <resource:modulargolems:netherite_golem_spear>,
  <resource:modulargolems:iron_golem_axe>,
  <resource:modulargolems:diamond_golem_axe>,
  <resource:modulargolems:netherite_golem_axe>,
  <resource:modulargolems:iron_golem_sword>,
  <resource:modulargolems:diamond_golem_sword>,
  <resource:modulargolems:netherite_golem_sword>,

  // Mystical Agriculture
  <resource:mysticalagriculture:inferium_sword>,
  <resource:mysticalagriculture:inferium_pickaxe>,
  <resource:mysticalagriculture:inferium_shovel>,
  <resource:mysticalagriculture:inferium_axe>,
  <resource:mysticalagriculture:inferium_hoe>,
  <resource:mysticalagriculture:inferium_bow>,
  <resource:mysticalagriculture:inferium_crossbow>,
  <resource:mysticalagriculture:inferium_shears>,
  <resource:mysticalagriculture:inferium_fishing_rod>,
  <resource:mysticalagriculture:inferium_sickle>,
  <resource:mysticalagriculture:inferium_scythe>,
  <resource:mysticalagriculture:prudentium_sword>,
  <resource:mysticalagriculture:prudentium_pickaxe>,
  <resource:mysticalagriculture:prudentium_shovel>,
  <resource:mysticalagriculture:prudentium_axe>,
  <resource:mysticalagriculture:prudentium_hoe>,
  <resource:mysticalagriculture:prudentium_bow>,
  <resource:mysticalagriculture:prudentium_crossbow>,
  <resource:mysticalagriculture:prudentium_shears>,
  <resource:mysticalagriculture:prudentium_fishing_rod>,
  <resource:mysticalagriculture:prudentium_sickle>,
  <resource:mysticalagriculture:prudentium_scythe>,
  <resource:mysticalagriculture:tertium_sword>,
  <resource:mysticalagriculture:tertium_pickaxe>,
  <resource:mysticalagriculture:tertium_shovel>,
  <resource:mysticalagriculture:tertium_axe>,
  <resource:mysticalagriculture:tertium_hoe>,
  <resource:mysticalagriculture:tertium_bow>,
  <resource:mysticalagriculture:tertium_crossbow>,
  <resource:mysticalagriculture:tertium_shears>,
  <resource:mysticalagriculture:tertium_fishing_rod>,
  <resource:mysticalagriculture:tertium_sickle>,
  <resource:mysticalagriculture:tertium_scythe>,
  <resource:mysticalagriculture:imperium_sword>,
  <resource:mysticalagriculture:imperium_pickaxe>,
  <resource:mysticalagriculture:imperium_shovel>,
  <resource:mysticalagriculture:imperium_axe>,
  <resource:mysticalagriculture:imperium_hoe>,
  <resource:mysticalagriculture:imperium_bow>,
  <resource:mysticalagriculture:imperium_crossbow>,
  <resource:mysticalagriculture:imperium_shears>,
  <resource:mysticalagriculture:imperium_fishing_rod>,
  <resource:mysticalagriculture:imperium_sickle>,
  <resource:mysticalagriculture:imperium_scythe>,
  <resource:mysticalagriculture:supremium_sword>,
  <resource:mysticalagriculture:supremium_pickaxe>,
  <resource:mysticalagriculture:supremium_shovel>,
  <resource:mysticalagriculture:supremium_axe>,
  <resource:mysticalagriculture:supremium_hoe>,
  <resource:mysticalagriculture:supremium_bow>,
  <resource:mysticalagriculture:supremium_crossbow>,
  <resource:mysticalagriculture:supremium_shears>,
  <resource:mysticalagriculture:supremium_fishing_rod>,
  <resource:mysticalagriculture:supremium_sickle>,
  <resource:mysticalagriculture:supremium_scythe>,
  <resource:mysticalagriculture:awakened_supremium_sword>,
  <resource:mysticalagriculture:awakened_supremium_pickaxe>,
  <resource:mysticalagriculture:awakened_supremium_shovel>,
  <resource:mysticalagriculture:awakened_supremium_axe>,
  <resource:mysticalagriculture:awakened_supremium_hoe>,
  <resource:mysticalagriculture:awakened_supremium_bow>,
  <resource:mysticalagriculture:awakened_supremium_crossbow>,
  <resource:mysticalagriculture:awakened_supremium_shears>,
  <resource:mysticalagriculture:awakened_supremium_fishing_rod>,
  <resource:mysticalagriculture:awakened_supremium_sickle>,
  <resource:mysticalagriculture:awakened_supremium_scythe>,
  <resource:mysticalagriculture:inferium_helmet>,
  <resource:mysticalagriculture:inferium_chestplate>,
  <resource:mysticalagriculture:inferium_leggings>,
  <resource:mysticalagriculture:inferium_boots>,
  <resource:mysticalagriculture:prudentium_helmet>,
  <resource:mysticalagriculture:prudentium_chestplate>,
  <resource:mysticalagriculture:prudentium_leggings>,
  <resource:mysticalagriculture:prudentium_boots>,
  <resource:mysticalagriculture:tertium_helmet>,
  <resource:mysticalagriculture:tertium_chestplate>,
  <resource:mysticalagriculture:tertium_leggings>,
  <resource:mysticalagriculture:tertium_boots>,
  <resource:mysticalagriculture:imperium_helmet>,
  <resource:mysticalagriculture:imperium_chestplate>,
  <resource:mysticalagriculture:imperium_leggings>,
  <resource:mysticalagriculture:imperium_boots>,
  <resource:mysticalagriculture:supremium_helmet>,
  <resource:mysticalagriculture:supremium_chestplate>,
  <resource:mysticalagriculture:supremium_leggings>,
  <resource:mysticalagriculture:supremium_boots>,
  <resource:mysticalagriculture:awakened_supremium_helmet>,
  <resource:mysticalagriculture:awakened_supremium_chestplate>,
  <resource:mysticalagriculture:awakened_supremium_leggings>,
  <resource:mysticalagriculture:awakened_supremium_boots>,

  // Forcecraft
  <resource:forcecraft:force_axe>,
  <resource:forcecraft:force_boots>,
  <resource:forcecraft:force_bow>,
  <resource:forcecraft:force_chest>,
  <resource:forcecraft:force_helmet>,
  <resource:forcecraft:force_legs>,
  <resource:forcecraft:force_mitt>,
  <resource:forcecraft:force_pickaxe>,
  <resource:forcecraft:force_rod>,
  <resource:forcecraft:force_shears>,
  <resource:forcecraft:force_shovel>,
  <resource:forcecraft:force_sword>,
  <resource:forcecraft:force_wrench>,


  // Ex Nihilo
  <resource:exnihilosequentia:andesite_hammer>,
  <resource:exnihilosequentia:bamboo_hammer>,
  <resource:exnihilosequentia:basalt_hammer>,
  <resource:exnihilosequentia:blackstone_hammer>,
  <resource:exnihilosequentia:bone_hammer>,
  <resource:exnihilosequentia:calcite_hammer>,
  <resource:exnihilosequentia:cherry_hammer>,
  <resource:exnihilosequentia:copper_hammer>,
  <resource:exnihilosequentia:deepslate_hammer>,
  <resource:exnihilosequentia:diamond_hammer>,
  <resource:exnihilosequentia:diorite_hammer>,
  <resource:exnihilosequentia:dripstone_hammer>,
  <resource:exnihilosequentia:golden_hammer>,
  <resource:exnihilosequentia:granite_hammer>,
  <resource:exnihilosequentia:iron_hammer>,
  <resource:exnihilosequentia:nether_brick_hammer>,
  <resource:exnihilosequentia:netherite_hammer>,
  <resource:exnihilosequentia:red_nether_brick_hammer>,
  <resource:exnihilosequentia:stone_hammer>,
  <resource:exnihilosequentia:terracotta_hammer>,
  <resource:exnihilosequentia:tuff_hammer>,
  <resource:exnihilosequentia:wooden_hammer>,

  // Minecraft
  <resource:minecraft:wooden_shovel>,
  <resource:minecraft:wooden_pickaxe>,
  <resource:minecraft:wooden_axe>,
  <resource:minecraft:wooden_hoe>,
  <resource:minecraft:stone_shovel>,
  <resource:minecraft:stone_pickaxe>,
  <resource:minecraft:stone_axe>,
  <resource:minecraft:stone_hoe>,
  <resource:minecraft:iron_shovel>,
  <resource:minecraft:iron_pickaxe>,
  <resource:minecraft:iron_axe>,
  <resource:minecraft:iron_hoe>,
  <resource:minecraft:golden_shovel>,
  <resource:minecraft:golden_pickaxe>,
  <resource:minecraft:golden_axe>,
  <resource:minecraft:golden_hoe>,
  <resource:minecraft:diamond_shovel>,
  <resource:minecraft:diamond_pickaxe>,
  <resource:minecraft:diamond_axe>,
  <resource:minecraft:diamond_hoe>,
  <resource:minecraft:netherite_shovel>,
  <resource:minecraft:netherite_pickaxe>,
  <resource:minecraft:netherite_axe>,
  <resource:minecraft:netherite_hoe>,
  <resource:minecraft:fishing_rod>,
  <resource:minecraft:flint_and_steel>,
  <resource:minecraft:shears>,
  <resource:minecraft:brush>,
  <resource:minecraft:carrot_on_a_stick>,
  <resource:minecraft:warped_fungus_on_a_stick>,
  <resource:minecraft:wooden_sword>,
  <resource:minecraft:stone_sword>,
  <resource:minecraft:iron_sword>,
  <resource:minecraft:golden_sword>,
  <resource:minecraft:diamond_sword>,
  <resource:minecraft:netherite_sword>,
  <resource:minecraft:trident>,
  <resource:minecraft:shield>,
  <resource:minecraft:leather_helmet>,
  <resource:minecraft:leather_chestplate>,
  <resource:minecraft:leather_leggings>,
  <resource:minecraft:leather_boots>,
  <resource:minecraft:chainmail_helmet>,
  <resource:minecraft:chainmail_chestplate>,
  <resource:minecraft:chainmail_leggings>,
  <resource:minecraft:chainmail_boots>,
  <resource:minecraft:iron_helmet>,
  <resource:minecraft:iron_chestplate>,
  <resource:minecraft:iron_leggings>,
  <resource:minecraft:iron_boots>,
  <resource:minecraft:golden_helmet>,
  <resource:minecraft:golden_chestplate>,
  <resource:minecraft:golden_leggings>,
  <resource:minecraft:golden_boots>,
  <resource:minecraft:diamond_helmet>,
  <resource:minecraft:diamond_chestplate>,
  <resource:minecraft:diamond_leggings>,
  <resource:minecraft:diamond_boots>,
  <resource:minecraft:netherite_helmet>,
  <resource:minecraft:netherite_chestplate>,
  <resource:minecraft:netherite_leggings>,
  <resource:minecraft:netherite_boots>,
  <resource:minecraft:turtle_helmet>,
  <resource:minecraft:bow>,
  <resource:minecraft:crossbow>,
  <resource:minecraft:elytra>,

  // Silent's Gear
  <resource:silentgear:sword>,
  <resource:silentgear:katana>,
  <resource:silentgear:machete>,
  <resource:silentgear:spear>,
  <resource:silentgear:trident>,
  <resource:silentgear:knife>,
  <resource:silentgear:dagger>,
  <resource:silentgear:pickaxe>,
  <resource:silentgear:shovel>,
  <resource:silentgear:axe>,
  <resource:silentgear:paxel>,
  <resource:silentgear:hammer>,
  <resource:silentgear:excavator>,
  <resource:silentgear:saw>,
  <resource:silentgear:prospector_hammer>,
  <resource:silentgear:hoe>,
  <resource:silentgear:mattock>,
  <resource:silentgear:sickle>,
  <resource:silentgear:shears>,
  <resource:silentgear:fishing_rod>,
  <resource:silentgear:bow>,
  <resource:silentgear:crossbow>,
  <resource:silentgear:slingshot>,
  <resource:silentgear:shield>,
  <resource:silentgear:arrow>,
  <resource:silentgear:helmet>,
  <resource:silentgear:chestplate>,
  <resource:silentgear:leggings>,
  <resource:silentgear:boots>,
  <resource:silentgear:elytra>,
  <resource:silentgear:ring>,
  <resource:silentgear:bracelet>,

  // Sophisticated Storage
  <resource:sophisticatedstorage:paintbrush>,

  // AE2
  <resource:ae2:nether_quartz_wrench>,
  <resource:ae2:certus_quartz_wrench>,
  <resource:ae2:certus_quartz_cutting_knife>,
  <resource:ae2:nether_quartz_cutting_knife>,

  // Ars
  <resource:ars_nouveau:runic_chalk>,
  <resource:ars_nouveau:dominion_wand>,
  <resource:ars_nouveau:wand>,
  <resource:ars_nouveau:spell_bow>,
  <resource:ars_nouveau:enchanters_sword>,
  <resource:ars_nouveau:sorcerer_boots>,
  <resource:ars_nouveau:sorcerer_leggings>,
  <resource:ars_nouveau:sorcerer_robes>,
  <resource:ars_nouveau:sorcerer_hood>,
  <resource:ars_nouveau:arcanist_boots>,
  <resource:ars_nouveau:arcanist_leggings>,
  <resource:ars_nouveau:arcanist_robes>,
  <resource:ars_nouveau:arcanist_hood>,
  <resource:ars_nouveau:battlemage_boots>,
  <resource:ars_nouveau:battlemage_leggings>,
  <resource:ars_nouveau:battlemage_robes>,
  <resource:ars_nouveau:battlemage_hood>,
  <resource:ars_nouveau:dowsing_rod>,
  <resource:ars_nouveau:spell_crossbow>,
  <resource:ars_nouveau:enchanters_eye>,

  // BHC
  <resource:bhc:blade_of_vitality>,

  // Botania
  <resource:botania:dirt_rod>,
  <resource:botania:skydirt_rod>,
  <resource:botania:terraform_rod>,
  <resource:botania:cobble_rod>,
  <resource:botania:water_rod>,
  <resource:botania:tornado_rod>,
  <resource:botania:fire_rod>,
  <resource:botania:divining_rod>,
  <resource:botania:smelt_rod>,
  <resource:botania:exchange_rod>,
  <resource:botania:rainbow_rod>,
  <resource:botania:gravity_rod>,
  <resource:botania:missile_rod>,
  <resource:botania:manasteel_helmet>,
  <resource:botania:manasteel_chestplate>,
  <resource:botania:manasteel_leggings>,
  <resource:botania:manasteel_boots>,
  <resource:botania:manasteel_pick>,
  <resource:botania:manasteel_shovel>,
  <resource:botania:manasteel_axe>,
  <resource:botania:manasteel_hoe>,
  <resource:botania:manasteel_sword>,
  <resource:botania:manasteel_shears>,
  <resource:botania:elementium_helmet>,
  <resource:botania:elementium_chestplate>,
  <resource:botania:elementium_leggings>,
  <resource:botania:elementium_boots>,
  <resource:botania:elementium_pickaxe>,
  <resource:botania:elementium_shovel>,
  <resource:botania:elementium_axe>,
  <resource:botania:elementium_hoe>,
  <resource:botania:elementium_sword>,
  <resource:botania:elementium_shears>,
  <resource:botania:terrasteel_helmet>,
  <resource:botania:terrasteel_chestplate>,
  <resource:botania:terrasteel_leggings>,
  <resource:botania:terrasteel_boots>,
  <resource:botania:terra_pick>,
  <resource:botania:terra_axe>,
  <resource:botania:terra_sword>,
  <resource:botania:star_sword>,
  <resource:botania:thunder_sword>,
  <resource:botania:manaweave_helmet>,
  <resource:botania:manaweave_chestplate>,
  <resource:botania:manaweave_leggings>,
  <resource:botania:manaweave_boots>,
  <resource:botania:ender_dagger>,
  <resource:botania:glass_pickaxe>,
  <resource:botania:livingwood_bow>,
  <resource:botania:crystal_bow>,
  <resource:botania:king_key>,

  // Thermal
  <resource:thermal:beekeeper_helmet>,
  <resource:thermal:beekeeper_chestplate>,
  <resource:thermal:beekeeper_leggings>,
  <resource:thermal:beekeeper_boots>,
  <resource:thermal:diving_helmet>,
  <resource:thermal:diving_chestplate>,
  <resource:thermal:diving_leggings>,
  <resource:thermal:diving_boots>,
  <resource:thermal:hazmat_helmet>,
  <resource:thermal:hazmat_chestplate>,
  <resource:thermal:hazmat_leggings>,
  <resource:thermal:hazmat_boots>,

  // Construction wand
  <resource:constructionwand:stone_wand>,
  <resource:constructionwand:iron_wand>,
  <resource:constructionwand:diamond_wand>,
  <resource:constructionwand:infinity_wand>,

  // MC Paint
  <resource:mcpaint:brush>,
  <resource:mcpaint:stamp>,

  // Mob Grinding Utils
  <resource:mob_grinding_utils:monocle>,

  // Modular Golems
  <resource:modulargolems:retrieval_wand>,
  <resource:modulargolems:command_wand>,
  <resource:modulargolems:summon_wand>,
  <resource:modulargolems:rider_wand>,
  <resource:modulargolems:squad_wand>,
  <resource:modulargolems:omnipotent_wand_command>,
  <resource:modulargolems:roman_guard_helmet>,
  <resource:modulargolems:roman_guard_chestplate>,
  <resource:modulargolems:roman_guard_shinguard>,
  <resource:modulargolems:wind_spirit_helmet>,
  <resource:modulargolems:wind_spirit_chestplate>,
  <resource:modulargolems:wind_spirit_shinguard>,
  <resource:modulargolems:barbaric_vanguard_helmet>,
  <resource:modulargolems:barbaric_vanguard_chestplate>,
  <resource:modulargolems:barbaric_vanguard_shinguard>,
  <resource:modulargolems:iron_golem_spear>,
  <resource:modulargolems:diamond_golem_spear>,
  <resource:modulargolems:netherite_golem_spear>,
  <resource:modulargolems:iron_golem_axe>,
  <resource:modulargolems:diamond_golem_axe>,
  <resource:modulargolems:netherite_golem_axe>,
  <resource:modulargolems:iron_golem_sword>,
  <resource:modulargolems:diamond_golem_sword>,
  <resource:modulargolems:netherite_golem_sword>,

  // Occultism
  <resource:occultism:infused_pickaxe>,
  <resource:occultism:iesnium_pickaxe>,
  <resource:occultism:chalk_white>,
  <resource:occultism:chalk_gold>,
  <resource:occultism:chalk_purple>,
  <resource:occultism:chalk_red>,
  <resource:occultism:divination_rod>,
  <resource:occultism:butcher_knife>,

  // Pickletweaks
  <resource:pickletweaks:night_vision_goggles>,
  <resource:pickletweaks:reinforced_night_vision_goggles>,

  // Framed Blocks
  <resource:framedblocks:framed_hammer>,
  <resource:framedblocks:framed_key>,
  <resource:framedblocks:framed_screwdriver>,
  <resource:framedblocks:framed_wrench>,

  // Friends and Foes
  <resource:friendsandfoes:wildfire_crown>,

  // Rechiseled
  <resource:rechiseled:chisel>,

  // Refurbished Furniture
  <resource:refurbished_furniture:knife>,
  <resource:refurbished_furniture:spatula>,

  // Supplementaries
  <resource:supplementaries:flute>,

  // Sushi Go Crafting
  <resource:sushigocrafting:cleaver_knife>,
  <resource:sushigocrafting:seaweed_on_a_stick>,

  // Waybackstone
  <resource:waybackstone:way_back_stone>,

  // Create Sabres
  <resource:create_sabers:brass_saber_white>,
  <resource:create_sabers:brass_saber_black>,
  <resource:create_sabers:brass_saber_blue>,
  <resource:create_sabers:brass_saber_lime>,
  <resource:create_sabers:brass_saber_yellow>,
  <resource:create_sabers:brass_saber_orange>,
  <resource:create_sabers:brass_saber_red>,
  <resource:create_sabers:brass_saber_pink>,
  <resource:create_sabers:brass_saber_purple>,
  <resource:create_sabers:zinc_saber_white>,
  <resource:create_sabers:zinc_saber_black>,
  <resource:create_sabers:zinc_saber_blue>,
  <resource:create_sabers:zinc_saber_lime>,
  <resource:create_sabers:zinc_saber_yellow>,
  <resource:create_sabers:zinc_saber_orange>,
  <resource:create_sabers:zinc_saber_red>,
  <resource:create_sabers:zinc_saber_pink>,
  <resource:create_sabers:zinc_saber_purple>,
  <resource:create_sabers:copper_saber_white>,
  <resource:create_sabers:copper_saber_black>,
  <resource:create_sabers:copper_saber_blue>,
  <resource:create_sabers:copper_saber_lime>,
  <resource:create_sabers:copper_saber_yellow>,
  <resource:create_sabers:copper_saber_orange>,
  <resource:create_sabers:copper_saber_red>,
  <resource:create_sabers:copper_saber_pink>,
  <resource:create_sabers:copper_saber_purple>,
  <resource:create_sabers:double_brass_saber_white>,
  <resource:create_sabers:double_brass_saber_black>,
  <resource:create_sabers:double_brass_saber_blue>,
  <resource:create_sabers:double_brass_saber_lime>,
  <resource:create_sabers:double_brass_saber_yellow>,
  <resource:create_sabers:double_brass_saber_orange>,
  <resource:create_sabers:double_brass_saber_red>,
  <resource:create_sabers:double_brass_saber_pink>,
  <resource:create_sabers:double_brass_saber_purple>,
  <resource:create_sabers:double_zinc_saber_white>,
  <resource:create_sabers:double_zinc_saber_black>,
  <resource:create_sabers:double_zinc_saber_blue>,
  <resource:create_sabers:double_zinc_saber_lime>,
  <resource:create_sabers:double_zinc_saber_yellow>,
  <resource:create_sabers:double_zinc_saber_orange>,
  <resource:create_sabers:double_zinc_saber_red>,
  <resource:create_sabers:double_zinc_saber_pink>,
  <resource:create_sabers:double_zinc_saber_purple>,
  <resource:create_sabers:double_copper_saber_white>,
  <resource:create_sabers:double_copper_saber_black>,
  <resource:create_sabers:double_copper_saber_blue>,
  <resource:create_sabers:double_copper_saber_lime>,
  <resource:create_sabers:double_copper_saber_yellow>,
  <resource:create_sabers:double_copper_saber_orange>,
  <resource:create_sabers:double_copper_saber_red>,
  <resource:create_sabers:double_copper_saber_pink>,
  <resource:create_sabers:double_copper_saber_purple>,
  <resource:create_sabers:brass_saber_galaxy>,

  <resource:simpletomb:grave_key>

];

<tag:items:datamancy:unbreakable>.addId(itemsForUnbreakable);
