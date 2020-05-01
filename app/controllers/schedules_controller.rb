class SchedulesController < ApplicationController 

  
    get "/schedules" do
        if logged_in?
            @user = current_user
            @schedules = Schedule.all
            erb :"schedules/schedules"
        else 
            redirect '/login'
        end
        
    end

    get "/schedules/new" do 
        if logged_in?
            erb :"schedules/new"
        else 
            redirect '/login'
        end
        
    end

    get "/schedules/:id" do
        
        if logged_in?
            id = params[:id]
            @schedule = Schedule.find_by_id(id)
            
            if @schedule 
                erb :"schedules/show_schedule"
            else 
                redirect "/schedules"
            end
        else 
            redirect '/login'
        end
        
        
    end

    post "/schedules" do 

        if logged_in?
            schedule = Schedule.new(params[:schedule])
            schedule.user_id = current_user[:id]
            if schedule.save
                redirect "/schedules/#{schedule.id}"
            else
                redirect "/schedules/new"
            end
        else 
            redirect '/login'
        end
       
    end


    get "/schedules/:id/edit" do

        if logged_in?
            @schedule = Schedule.find_by_id(params[:id])
            if @schedule && @schedule.user.id == session[:user_id]
                erb :"schedules/edit_schedule"
            else 
                redirect "/schedules/#{@schedule.id}"
            end
        else 
            redirect '/login'
        end
        
    end

    patch "/schedules/:id" do
        
        if logged_in?
            schedule = Schedule.find_by_id(params[:id])

            if schedule.update(params[:schedule])
                redirect "/schedules/#{schedule.id}"
            else
                redirect "/schedules/#{schedule.id}/edit"
            end
        else 
            redirect '/login'
        end
        
    end

    delete "/schedules/:id" do 
        if logged_in?
            schedule = Schedule.find_by_id(params[:id])

            if schedule.destroy 
                redirect "/schedules"
            else
                redirect "/schedules/#{schedule.id}"
            end
        else 
            redirect '/login'
        end
        
       
    end

   

    

  


end