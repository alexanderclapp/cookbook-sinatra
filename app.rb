require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do  # <- Router part

"<h1>Hello <em>world</em>!</h1>"
  # [...]   #
  # [...]   # <- Controller part
  # [...]   #

end
