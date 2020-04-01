class ApplicationController < Sinatra::Base  

    configure do
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions
        set :session_secret, "jobservation"
        register Sinatra::Flash
    end

    get "/" do 
        erb :index
    end 

    get "/sign-up" do 
        erb :sign_up
    end 

    post "/sign-up" do 
        user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])

        if user.save 
            session[:user_id] = user.id
            redirect to "/login"

        else 
            flash[:sign_up_failure] = "Email has already been taken. Please enter another email address."
            redirect to "/sign-up"
        end 
    end 

    get "/login" do 
        erb :login
    end 

    post "/login" do 
        user = User.find_by(:email => params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to "/organizer"

        else 
            flash[:login_failure] = "An invalid email or password has been entered."
            redirect to "/login"
        end 
    end 

    get "/organizer" do 
        @interviews = current_user.interviews
        @applications = current_user.applications
        erb :organizer, :layout => :user_layout
    end 

    get "/logout" do 
        session.clear
        redirect to "/"
    end 

    helpers do 
        def current_user
            User.find(session[:user_id])
        end 

        def is_logged_in?(session)
            !!session[:user_id]
        end 

        def is_owner?(id)
            current_user.id == id 
        end
        
        def can_view_edit_or_delete?(id, ability_type)
            if !is_owner?(id)
                flash[:warning] = "Warning: You do not have the ability to #{ability_type}."
                redirect to "/organizer", :layout => :user_layout
            end 
        end 
    end 
end 