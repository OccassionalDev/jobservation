class ApplicationController < Sinatra::Base  

    configure do
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions
        set :session_secret, "jobservation"
    end

    get '/' do 
        erb :index
    end 

    get '/sign-up' do 
        erb :sign_up
    end 

    post '/sign-up' do 
        user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])

        if user.save 
            session[:user_id] = user.id
            redirect to '/login'
        end 
    end 

    get '/login' do 
        erb :login
    end 

    post '/login' do 
        user = User.find_by(:email => params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/organizer'

        else 
            redirect '/login-failure'
        end 
    end 

    get '/organizer' do 
        erb :organizer 
    end 

    get '/login-failure' do 
        erb :login_failure
    end 

    get '/logout' do 
        session.clear
        redirect to '/'
    end 

    helpers do 
        def current_user 
            User.find(session[:user_id])
        end 

        def logged_in?
            !!current_user 
        end 
    end 
end 