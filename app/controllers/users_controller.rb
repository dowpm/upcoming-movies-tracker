class UsersController < ApplicationController
    # use Rack::Flash

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do

    end
end