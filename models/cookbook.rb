require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @file = csv_file_path
    @recipes = []
    create_recipe_from_csv(@file)
    # hash should normally have symbol. and it will not allow you to save same k
    # ey twice, plus difficult to change in hindsight
    # Here, row is an array of columns
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv!
  end

  # take info from viewer
  # pass through controller
  # add to recipe class
  # add to CSV file?

  def remove_recipe(index)
    @recipes.delete_at(index - 1)
    save_csv!
  end

  def mark_done(index)
    @recipes[index].done = true
    save_csv!
  end

  def save_csv!
    CSV.open(@file, "wb") do |csv|
      @recipes.each do |elem|
        csv << [elem.name, elem.description, elem.time, elem.link, elem.done]
        #if you replace wb with a it will append
        #instead of doing it this way you can then just
        # add after each time
      end
    end
    # please explain what code above does exactly
  end

  def create_recipe_from_csv(filepath)
    CSV.foreach(filepath) do |row|
      @recipes << Recipe.new({name: row[0], description: row[1], time: row[2], link: row[3], done: row[4]})
    end
    # Here, row is an array of columns
  end
end

# initialize(csv_file_path) which loads existing Recipe from the CSV
# all which returns all the recipies
# add_recipe(recipe) which adds a new recipe to the cookbook
# remove_recipe(recipe_index) which removes a recipe from the cookbook.
