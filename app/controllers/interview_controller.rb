class InterviewController < ApplicationController   
    get "/interviews/new" do
        if is_logged_in?(session)
            erb :"/interviews/new_interview", :layout => :user_layout
        else 
            flash[:warning] = "You cannot add any interviews if you are not logged in."
            redirect to "/organizer"
        end 
    end 

    post "/interviews" do 
        @interview = Interview.new(
            :company => params[:company],
            :position => params[:position],
            :date => params[:date],
            :time => params[:time],
            :notes => params[:notes],
            :location => params[:location]
        )

        @interview.user_id = current_user.id
        if @interview.save
            flash[:success] = "Success! The interview with #{@interview.company} was successfully to be created."
            redirect to "/organizer"
        else 
            flash[:error] = "Error: The interview was unable to be created."
            redirect to "/organizer"
        end 
    end 

    get "/interviews/:id" do 
        @interview = Interview.find(params[:id])
        can_view_edit_or_delete?(@interview.user_id, "view this page")
        erb :"/interviews/view", :layout => :user_layout
    end 

    get "/interviews/:id/edit" do 
        @interview = Interview.find(params[:id])
        
        can_view_edit_or_delete?(@interview.user_id, "edit this interview")
        erb :"/interviews/edit_interview", :layout => :user_layout
    end 

    patch "/interviews/:id" do
        @interview = Interview.find(params[:id])
        
        can_view_edit_or_delete?(@interview.user_id, "edit this interview")
        @interview.company = params[:company]
        @interview.position = params[:position]
        @interview.date = params[:date]
        @interview.time = params[:time]
        @interview.location = params[:location]
        @interview.notes = params[:notes]
        
        if @interview.save 
            flash[:success] = "Success! The interview was successfully changed."
            redirect to "/organizer"
        else 
            flash[:error] = "Error: Changes to the interview were not saved."
            redirect to "/organizer"
        end 
    end 

    delete "/interviews/:id" do 
        @interview = Interview.find(params[:id])

        can_view_edit_or_delete?(@interview.user_id, "delete this interview")
        flash[:success] = "Success! Interview with #{@interview.company} was deleted."
        @interview.delete 
        redirect to "/organizer"
    end 
end 