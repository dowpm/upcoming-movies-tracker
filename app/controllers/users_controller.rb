class UsersController < ApplicationController
    use Rack::Flash

    get '/signup' do
        redirect to '/' if logged_in?
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

    get '/login' do
        redirect to '/' if logged_in?
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by username: params[:user][:username]
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect '/'
        else
            flash[:msg] = "The username or password did not match our records. Please try again"
            redirect '/login'
        end
    end

    post '/logout' do
        session.clear if logged_in?
        redirect to '/'
    end

end