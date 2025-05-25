DO_ASSERT = DO_ASSERT or false

--- Adds a new ingredient to the specified recipe.
-- The ingredient must be in standard table form with `name`, `type`, and `amount` fields.
-- @param recipe_name (string) The name of the recipe to modify.
-- @param new_ingredient (table) The ingredient to add to the recipe's ingredient list.
function add_ingredient(recipe_name, new_ingredient)
    assert(not DO_ASSERT or type(recipe_name) == "string", "add_ingredient: recipe_name must be a string.")
    assert(not DO_ASSERT or type(new_ingredient) == "table", "add_ingredient: new_ingredient must be a table.")

    local recipe = data.raw.recipe[recipe_name]
    if not recipe then return end

    assert(not DO_ASSERT or type(recipe.ingredients) == "table", "add_ingredient: recipe.ingredients must be a table.")

    table.insert(recipe.ingredients, new_ingredient)
end

--- Removes a named ingredient from the specified recipe.
-- Matches ingredients by their `name` field and removes them in-place.
-- @param recipe_name (string) The name of the recipe to modify.
-- @param ingredient_name (string) The `name` of the ingredient to remove.
function remove_ingredient(recipe_name, ingredient_name)
    assert(not DO_ASSERT or type(recipe_name) == "string", "remove_ingredient: recipe_name must be a string.")
    assert(not DO_ASSERT or type(ingredient_name) == "string", "remove_ingredient: ingredient_name must be a string.")

    local recipe = data.raw.recipe[recipe_name]
    if not recipe then return end

    assert(not DO_ASSERT or type(recipe.ingredients) == "table", "remove_ingredient: recipe.ingredients must be a table.")

    for i = #recipe.ingredients, 1, -1 do
        if recipe.ingredients[i].name == ingredient_name then
            table.remove(recipe.ingredients, i)
            return
        end
    end
end

--- Modifies the `amount` of an existing ingredient in a recipe.
-- Only updates the `amount` field; the ingredient must already exist.
-- @param recipe_name (string) The name of the recipe to modify.
-- @param ingredient_name (string) The `name` of the ingredient to change.
-- @param ingredient_update (table) A table containing the new `amount` (must be a number).
function modify_ingredient(recipe_name, ingredient_name, ingredient_update)
    assert(not DO_ASSERT or type(recipe_name) == "string", "modify_ingredient: recipe_name must be a string.")
    assert(not DO_ASSERT or type(ingredient_name) == "string", "modify_ingredient: ingredient_name must be a string.")
    assert(not DO_ASSERT or type(ingredient_update) == "table", "modify_ingredient: ingredient_update must be a table.")
    assert(not DO_ASSERT or
        type(ingredient_update.amount) == "number", "modify_ingredient: ingredient_update.amount must be a number.")

    local recipe = data.raw.recipe[recipe_name]
    if not recipe then return end

    assert(not DO_ASSERT or type(recipe.ingredients) == "table", "modify_ingredient: recipe.ingredients must be a table.")

    for _, ingredient in ipairs(recipe.ingredients) do
        if ingredient.name == ingredient_name then
            ingredient.amount = ingredient_update.amount
            return
        end
    end
end

--- Replaces a specific ingredient in a recipe with a new one.
-- Finds the ingredient by `name` and replaces it entirely with a new table.
-- @param recipe_name (string) The name of the recipe to modify.
-- @param original_ingredient (string) The `name` of the ingredient to replace.
-- @param new_ingredient (table) The new ingredient table to insert in its place.
function replace_ingredient(recipe_name, original_ingredient, new_ingredient)
    assert(not DO_ASSERT or type(recipe_name) == "string", "replace_ingredient: recipe_name must be a string.")
    assert(not DO_ASSERT or
        type(original_ingredient) == "string", "replace_ingredient: original_ingredient must be a string.")
    assert(not DO_ASSERT or type(new_ingredient) == "table", "replace_ingredient: new_ingredient must be a table.")

    local recipe = data.raw.recipe[recipe_name]
    if not recipe then return end

    assert(not DO_ASSERT or
        type(recipe.ingredients) == "table", "replace_ingredient: recipe.ingredients must be a table.")

    for i, ingredient in ipairs(recipe.ingredients) do
        if ingredient.name == original_ingredient then
            recipe.ingredients[i] = new_ingredient
            return
        end
    end
end
