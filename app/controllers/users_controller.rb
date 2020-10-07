class UsersController < ApplicationController 

    get '/users/:id' do
        @current_user = current_user
        @user = User.find_by_id(params[:id]) || @current_user
        @posts = @user.posts
        erb :"users/show"
    end

    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        if @user.id == current_user.id
        erb :"users/edit"
        else
        redirect "/"
        end
    end

    patch '/users/:id' do
        @user = User.find_by_id(params[:id])
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.username = params[:username]
        @user.long_term_goal = params[:long_term_goal]
        @user.save
        redirect "/users/#{@user.id}"
    end

end
