class JobApplicationController < ApplicationController 
    get '/applications/new' do
        erb :'/applications/new_application'
    end 

    post '/applications/new' do 
        @current_user = User.find(session[:user_id])
        @application = Application.new(
            :company => params[:company],
            :position => params[:position],
            :date => params[:date],
            :status => params[:status]
        )

        @application.user_id = @current_user.id 
        @application.save

        redirect to '/organizer'
    end 

    get '/applications/edit-remove' do 
        current_user = User.find(session[:user_id])
        @applications = Application.all.select { |i| i.user_id == current_user.id}
        
        erb :'/applications/edit_remove_application_selection'
    end 

    get '/applications/edit/:id' do 
        @application = Application.find(params[:id])
        erb :'/applications/edit_application'
    end 

    patch '/applications/edit/:id' do
        @application = Application.find(params[:id])

        @application.company = params[:company]
        @application.position = params[:position]
        @application.date = params[:date]
        @application.status = params[:status]
        @application.save 

        redirect to '/organizer'
    end 

    delete '/applications/edit-remove/:id' do 
        @application = Application.find(params[:id])
        @application.delete 
        redirect to '/organizer'
    end 
end 