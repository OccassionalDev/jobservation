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

        else 
            redirect to '/sign-up-failure'
        end 
    end 

    get '/sign-up-failure' do 
        erb :sign_up_failure
    end 

    get '/login' do 
        erb :login
    end 

    post '/login' do 
        user = User.find_by(:email => params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/organizer'

        else 
            redirect to '/login-failure'
        end 
    end 

    get '/organizer' do 
        current_user = User.find(session[:user_id])
        @interviews = Interview.all.select { |i| i.user_id == current_user.id}
        @applications = Application.all.select { |a| a.user_id == current_user.id}
        erb :organizer 
    end 

    get '/edit-account' do 
        erb :edit_account
    end 

    patch '/edit-account' do 
        user = User.find(session[:user_id])

        if user.authenticate(params[:current_pass])
            @current_user = User.find(session[:user_id])

            @current_user.name = params[:name]
            @current_user.email = params[:email]

            if params[:password] != ""
                @current_user.password = params[:password]

            else 
                @current_user.password = params[:current_pass]
            end 

            @current_user.save 
            redirect to '/organizer'

        else 
            redirect to '/edit-account-failure'
        end 
    end 

    get '/edit-account-failure' do 
        erb :edit_account_failure
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
    end 
end 