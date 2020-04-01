class JobApplicationController < ApplicationController 
    get "/applications/new" do
        if is_logged_in?(session)
            erb :"/applications/new_application", :layout => :user_layout
        else 
            flash[:warning] = "You cannot add any applications if you are not logged in."
            redirect to "/organizer"
        end 
    end 

    post "/applications" do 
        @application = Application.new(
            :company => params[:company],
            :position => params[:position],
            :date => params[:date],
            :status => params[:status]
        )

        @application.user_id = current_user.id 
        if @application.save
            flash[:success] = "Success! The application with #{@application.company} was successfully created!"
            redirect to "/organizer"
        
        else 
            flash[:error] = "Error: The application was unable to be created."
            redirect to "/organizer"
        end  
    end 

    get "/applications/:id" do 
        @application = Application.find(params[:id])
        can_view_edit_or_delete?(@application.user_id, "view this page")
        erb :"/applications/view", :layout => :user_layout
    end 

    get "/applications/:id/edit" do 
        @application = Application.find(params[:id])

        can_view_edit_or_delete?(@application.user_id, "edit this application")
        erb :"/applications/edit_application", :layout => :user_layout  
    end 

    patch "/applications/:id" do
        @application = Application.find(params[:id])

        can_view_edit_or_delete?(@application.user_id, "edit this application.")
        @application.company = params[:company]
        @application.position = params[:position]
        @application.date = params[:date]
        @application.status = params[:status]
        
        if @application.save 
            flash[:success] = "Success! Changes to the application were saved!"
            redirect to "/organizer"
        else 
            flash[:error] = "Error: Changes to the application were not made."
            redirect to "/organizer"
        end 
    end 

    delete "/applications/:id" do 
        @application = Application.find(params[:id])

        can_view_edit_or_delete?(@application.user_id, "delete this application")
        @application.delete 
        redirect to "/organizer"
    end 
end 