
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do  #homepage
    redirect to '/articles'
  end

  get '/articles' do  #index
    @articles = Article.all 
    erb :index 
  end 

  get '/articles/new' do  #new
    @article = Article.new
    erb :new 
  end 

  post '/articles' do  #create
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"    
    erb :index
  end
  
  get '/articles/:id' do  #show
    @article = Article.find(params[:id])
    erb :show 
  end 

  get '/articles/:id/edit' do  #edit 
    @article = Article.find(params[:id])
    erb :edit 
  end 

  patch '/articles/:id' do  #update 
    @article = Article.find(params[:id])
    @article.update(params[:article]) 
    redirect to "/articles/#{@article.id}"
  end 

  delete '/articles/:id' do  #delete
    Article.destroy(params[:id])
    redirect to '/articles'
  end 




end
