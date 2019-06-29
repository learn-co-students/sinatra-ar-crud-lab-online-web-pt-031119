
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
  
  
  # Create-implemented in Sinatra by building a route, or controller action, to render a form for creating a new instance of your model
 
  get '/articles/new' do
      @article = Article.new
    erb :new
  end
  
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end
  
  # Read-deliver to our user, all of the instances of a class, or a specific instance of a class.
  
  #get all, @articles will be rendered by index.
  get "/articles" do
    @articles = Article.all
    erb :index
  end
  
  #get specific instance  @article will be rendered by show. 
  get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :show  
  end
  
  # Update-renders to edit.erb whic contains a form that will send 'patch' request to given object instance 
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
    patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end
  
  # Delete-mplemented via a "delete button"(actually a form) on the show page of a given instance.
  
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
 
end
  
  
