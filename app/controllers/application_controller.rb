require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SECRET"]  
  end

  get "/" do 
    @posts = Post.all
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
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], username: params[:username], password: params[:password])
    session[:user_id] = @user.id
    redirect "/"
  end

  get "/logout" do
    session.clear
  end


  helpers do
    def logged_in?
      session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end
  end
end
