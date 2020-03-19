class InterviewController < ApplicationController   
    get '/organizer/add-interview' do
        erb :new_interview 
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
end 