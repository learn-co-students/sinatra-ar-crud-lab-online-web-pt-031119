
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:article_title], content: params[:article_content])
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit'
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.title = params[:article_title]
    article.content = params[:article_content]
    article.save
    redirect "/articles#{article.id}"
  end

end
