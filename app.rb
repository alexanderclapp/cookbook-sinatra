require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "models/cookbook"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do  # <- Router part
  erb :index
  # [...]   #
  # [...]   # <- Controller part
  # [...]   #
end

get '/recipes' do
  @cookbook = Cookbook.new('recipes.csv')
  @recipes = @cookbook.all
  erb :recipes
end

get '/destroyview' do
  @cookbook = Cookbook.new('recipes.csv')
  @recipes = @cookbook.all
  erb :destroyview

  # @cookbook = Cookbook.new('recipes.csv')
  # @recipes = @cookbook.all
  # destroy_index = @view.destroy_recipe.to_i
  # @cookbook.remove_recipe(destroy_index)
end

get 'destroy' do
  @cookbook = Cookbook.new('recipes.csv')
  destroy_index = params[:index]
  @cookbook.remove_recipe(destroy_index)
  @recipes = @cookbook.all
  erb :recipes
end
