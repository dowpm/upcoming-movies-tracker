require_relative 'config/environment.rb'

use Rack::MethodOverride

use UsersController
use GenresController
use MoviesController
run ApplicationController