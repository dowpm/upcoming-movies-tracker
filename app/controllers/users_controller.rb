class UsersController < ApplicationController
    use Rack::Flash

    get '/signup' do
        @user = User.new
        erb :'users/signup'
    end

    post '/signup' do
        # raise params.inspect
        @user = User.new params[:user]

        if @user.save
            flash[:msg] = "You've been successfully registered"
            redirect '/'
        else            
            erb :'users/signup'
        end
    end
end