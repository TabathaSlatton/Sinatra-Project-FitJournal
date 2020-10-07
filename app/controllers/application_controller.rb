require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions, true
  end

  get "/" do 
    @posts = Post.all
    erb :index  
  end

  get "/login" do
    erb :login
  end
end
