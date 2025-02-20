/*!
 * Copyright (c) 2024 Darkosto Entertainment LLC
 *
 * All rights reserved.
 */


setSpawnStructure("structures/oaktree", 64);

function buildChunkGenerator(seed, biomeRegistry, dimensionSettingsRegistry) {
	var biomesToRemove = Java.to(
		[],
		"java.lang.String[]"
	);
	var biomeTypesToRemove = Java.to(
		[
			BiomeDictionary.Type.WATER,
			BiomeDictionary.Type.BEACH,
			BiomeDictionary.Type.VOID,
			BiomeDictionary.Type.OCEAN,
		],
		"net.minecraftforge.common.BiomeDictionary$Type[]"
	);
	var biomes = Util.Biomes.withoutBiomes(Util.Biomes.withoutTypes(Util.Biomes.forOverworld(), biomeTypesToRemove), biomesToRemove);
	
	var biomeProvider = new MultiBiomeProvider(biomes, seed, 3, biomeRegistry);
	
	return new ChunkGeneratorVoid(biomeProvider, function() {
		return Util.Registries.get(dimensionSettingsRegistry, "minecraft:overworld");
	}, seed);
}
