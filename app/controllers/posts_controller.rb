class PostsController < ApplicationController 

    get '/posts' do 
        redirect_if_not_logged_in
        @user = current_user
        @posts = Post.all
        erb :index
     end

     patch '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        @post.theme = params[:theme]
        @post.content = params[:content]
        @post.save
        redirect "/posts"
    end

    
    post '/posts' do
        post = Post.new(user_id: current_user.id, theme: params[:theme], content: params[:content])
        if post.save
            redirect "/posts"
        else
            # flash error (we learned these 10/06)
            redirect "/posts"
        end
    end 

    get '/posts/:id/edit' do
        redirect_if_not_logged_in
        @post = Post.find_by_id(params[:id])
        erb :"posts/edit"
    end


    delete '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        @post.destroy
        redirect "/posts"
    end

   
end