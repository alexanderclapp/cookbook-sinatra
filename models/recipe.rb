class Recipe
  attr_accessor :name, :description, :link, :time, :done

  def initialize(recipe_attributes = {})
    @name = recipe_attributes[:name]
    @description = recipe_attributes[:description]
    @link = recipe_attributes[:link]
    @time = recipe_attributes[:time]
    @done = recipe_attributes[:done]
  end
end
