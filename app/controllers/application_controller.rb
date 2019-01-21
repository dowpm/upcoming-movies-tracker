class ApplicationController < Sinatra::Base

    configure do
        enable :sessions
        set :session_secret, "93160167"
        set :public_folder, 'public'
        set :views, 'app/views'
    end

    get '/' do
        erb :index
    end

    helpers do
        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
        
        def require_logged_in
            if !logged_in?
                session.clear
                redirect to '/login'
            end
        end    
    end

end