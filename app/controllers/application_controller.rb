require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SECRET"]  
  end

  get "/" do 
    redirect_if_not_logged_in
    @posts = Post.all.sort_by{|post| post.updated_at ||post.created_at}.reverse
    @user = User.find(session[:user_id])
    erb :index  
  end

  get "/login" do
    erb :"sessions/login"
  end

  get "/signup" do 
    erb :"sessions/signup"
  end
  
  post "/login" do
    user = User.find_by(email_address: params[:email_address])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/"
    else
        redirect "/login"
    end
  end

  post "/signup" do 
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], username: params[:username], password: params[:password])
    if @user.save
    session[:user_id] = @user.id
    redirect "/"
    else
      redirect "/signup"
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end


  helpers do
    def logged_in?
      session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end
  end
end
