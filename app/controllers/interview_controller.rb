class InterviewController < ApplicationController   
    get '/interviews/new' do
        erb :'/interviews/new_interview', :layout => :user_layout
    end 

    post '/interviews/new' do 
        @interview = Interview.new(
            :company => params[:company],
            :position => params[:position],
            :date => params[:date],
            :time => params[:time],
            :notes => params[:notes],
            :location => params[:location]
        )

        @interview.user_id = current_user.id
        @interview.save

        redirect to '/organizer' 
    end 

    get '/interviews/:id' do 
        @interview = Interview.find(params[:id])
        erb :'/interviews/view', :layout => :user_layout
    end 

    get '/interviews/:id/edit' do 
        @interview = Interview.find(params[:id])

        can_view_edit_or_delete?(@interview.id)
        erb :'/interviews/edit_interview', :layout => :user_layout
    end 

    patch '/interviews/:id' do
        @interview = Interview.find(params[:id])
        
        can_view_edit_or_delete?(@interview.id)
        @interview.company = params[:company]
        @interview.position = params[:position]
        @interview.date = params[:date]
        @interview.time = params[:time]
        @interview.location = params[:location]
        @interview.notes = params[:notes]
        @interview.save 

        redirect to '/organizer'
    end 

    delete '/interviews/:id' do 
        @interview = Interview.find(params[:id])
        can_view_edit_or_delete?(@interview.id)
        @interview.delete 
        redirect to '/organizer'
    end 
end 