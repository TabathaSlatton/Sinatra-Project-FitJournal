class PostsController < ApplicationController 

    get '/posts' do 
        @user = current_user
        @posts = Post.all
        erb :index
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

    patch 'posts/:id' do
        @post = Post.find_by_id(params[:id])
        @post.theme = params[:theme]
        @post.content = params[:content]
        @post.save
        redirect "/posts"
    end

    delete 'posts/:id' do
        @post = Post.find_by_id(params[:id])
        @post.destroy
        redirect "/posts"
    end
end