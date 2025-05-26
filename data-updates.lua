require("data-utils")

local recycling = {}
if mods["quality"] then recycling = require("__quality__/prototypes/recycling") end

local technology = {}
technology = data.raw["technology"]["early-personal-roboport-equipment"]
if technology then
    technology.prerequisites = { "electricity" }
end

local recipe = {}
recipe = data.raw["recipe"]["early-construction-robot"]
if recipe then
    replace_ingredient(recipe.name, "iron-gear-wheel",
        { type = "item", name = "electric-motor", amount = 8 })
    if mods["quality"] then recycling.generate_recycling_recipe(recipe) end
end

recipe = data.raw["recipe"]["burner-generator-equipment"]
if recipe then
    modify_ingredient(recipe.name, "copper-plate", { amount = 8 })
    modify_ingredient(recipe.name, "iron-plate", { amount = 2 })
    modify_ingredient(recipe.name, "iron-gear-wheel", { amount = 10 })
    replace_ingredient(recipe.name, "boiler", { type = "item", name = "burner-turbine", amount = 1 })
    if mods["quality"] then recycling.generate_recycling_recipe(recipe) end
end

recipe = data.raw["recipe"]["early-personal-roboport-equipment"]
if recipe then
    modify_ingredient(recipe.name, "copper-plate", { amount = 8 })
    modify_ingredient(recipe.name, "iron-gear-wheel", { amount = 20 })
    replace_ingredient(recipe.name, "iron-plate", { type = "item", name = "electric-motor", amount = 4 })
    if mods["quality"] then recycling.generate_recycling_recipe(recipe) end
end

recipe = data.raw["recipe"]["personal-roboport-equipment"]
if recipe then
    replace_ingredient(recipe.name, "iron-gear-wheel",
        { type = "item", name = "early-personal-roboport-equipment", amount = 1 })
    if mods["quality"] then recycling.generate_recycling_recipe(recipe) end
end

recipe = data.raw["recipe"]["fission-reactor-equipment"]
if recipe then
    add_ingredient(recipe.name, { type = "item", name = "burner-generator-equipment", amount = 1 })
    if mods["quality"] then recycling.generate_recycling_recipe(recipe) end
end
