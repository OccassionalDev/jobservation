class InterviewController < ApplicationController   
    get '/organizer/add-interview' do
        erb :'/interviews/new_interview'
    end 

    post '/organizer/add-interview' do 
        @current_user = User.find(session[:user_id])
        @interview = Interview.new(
            :company => params[:company],
            :position => params[:position],
            :date => params[:date],
            :time => params[:time]
        )

        @interview.user_id = @current_user.id 
        @interview.save

        redirect to '/organizer'
    end 

    get '/organizer/edit-remove-interview' do 
        current_user = User.find(session[:user_id])
        @interviews = Interview.all.select { |i| i.user_id == current_user.id}
        
        erb :'/interviews/edit_remove_interview_selection'
    end 

    get '/organizer/edit-remove-interview/:id' do 
        @interview = Interview.find(params[:id])
        erb :'/interviews/edit_interview'
    end 

    patch '/organizer/edit-remove-interview/:id' do
        @interview = Interview.find(params[:id])

        @interview.company = params[:company]
        @interview.position = params[:position]
        @interview.date = params[:date]
        @interview.time = params[:time]
        @interview.save 

        redirect to '/organizer'
    end 

    delete '/organizer/edit-remove-interview/:id' do 
        @interview = Interview.find(params[:id])
        @interview.delete 
        redirect to '/organizer'
    end 
end 