require_relative 'config/environment.rb'

use Rack::MethodOverride

use GenresController
use UsersController
use MoviesController
run ApplicationController