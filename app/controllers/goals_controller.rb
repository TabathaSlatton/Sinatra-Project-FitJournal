class GoalsController < ApplicationController
    get '/goals' do 
        redirect_if_not_logged_in
        @user = current_user
        @goals = Goal.all
        erb :"/goals/index"
     end

    patch '/goals/:id/complete' do
        @goal = Goal.find_by_id(params[:id])
        @goal.complete = params[:complete]
        @goal.save
        redirect "/goals"
    end

    patch '/goals/:id' do
        @goal = Goal.find_by_id(params[:id])
        @goal.name = params[:name]
        @goal.description = params[:description]
        @goal.how_long = params[:how_long]
        @goal.reward = params[:reward]
        @goal.save
        redirect "/goals"
    end

    
    post '/goals' do
        goal = Goal.new(user_id: current_user.id, name: params[:name], description: params[:description], how_long: params[:how_long], reward: params[:reward])
        if goal.save
            redirect "/goals"
        else
            # flash error (we learned these 10/06)
            redirect "/goals"
        end
    end 
   

    get '/goals/:id/edit' do
        redirect_if_not_logged_in
        @users = User.all
        @goal = Goal.find_by_id(params[:id])
        erb :"goals/edit"
    end


    delete '/goals/:id' do
        @goal = Goal.find_by_id(params[:id])
        @goal.destroy
        redirect "/goals"
    end

end