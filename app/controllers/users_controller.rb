class UsersController < ApplicationController 

    get '/users/:id' do
        @current_user = current_user
        @user = User.find_by_id(params[:id])
        @posts = Post.all
        erb :"users/show"
    end

end
