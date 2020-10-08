class GoalsController < ApplicationController
    get '/goals' do 
        redirect_if_not_logged_in
        @user = current_user
        @goals = Goal.all.map {|goal| goal.user_id == @user.id}
        erb :"/goals/index"
     end

    #  patch '/posts/:id' do
    #     @post = Post.find_by_id(params[:id])
    #     @post.theme = params[:theme]
    #     @post.content = params[:content]
    #     @post.save
    #     redirect "/posts"
    # end

    
    post '/goals' do
        goal = Goal.new(user_id: current_user.id, name: params[:name], description: params[:description], how_long: params[:how_long], reward: params[:reward])
        if goal.save
            redirect "/goals"
        else
            # flash error (we learned these 10/06)
            redirect "/goals"
        end
    end 
   

    # get '/posts/:id/edit' do
    #     redirect_if_not_logged_in
    #     @users = User.all
    #     @post = Post.find_by_id(params[:id])
    #     erb :"posts/edit"
    # end


    # delete '/posts/:id' do
    #     @post = Post.find_by_id(params[:id])
    #     @post.destroy
    #     redirect "/posts"
    # end

end