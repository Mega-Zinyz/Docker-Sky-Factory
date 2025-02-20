import crafttweaker.api.item.IItemStack;
import crafttweaker.api.text.Component;

val color = Globals.colors[ColorName.Brown];
val textColor = 0xFFFFFF;
val component = Component.literal(color.getName()).withStyle(style => style.withColor(textColor));

val items as IItemStack[] = [
];

<tag:items:skyfactory_5:colored_items/brown>.asIIngredient().addTooltip(component);
for item in items {
  item.addTooltip(component);
}
