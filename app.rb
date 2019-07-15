require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'

require_relative '../../01-Cookbook-Advanced/lib/cookbook.rb'
require_relative '../../01-Cookbook-Advanced/lib/recipe.rb'

set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @cookbook = Cookbook.new('../../01-Cookbook-Advanced/lib/recipes.csv')
  @recipes = @cookbook.recipes
  erb :index
end

get '/new' do
  erb :new
end
