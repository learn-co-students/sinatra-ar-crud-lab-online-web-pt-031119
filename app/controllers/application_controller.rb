
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
    article = Article.new({name: params[:name], content: params[:content]})
    article.save

    redirect to '/articles'
  end

  get '/articles' do
    @articles=Article.all

    erb :index
  end

  get '/articles/:id/edit' do
    @articles = Article.find(params[:id].to_i)

    erb :edit
  end

  patch '/articles/:id' do
    articles = Article.find(params[:id].to_i)
    articles.update(name: params[:name])
    articles.update(content: params[:content])
    articles.save

    redirect to '/articles/'+article.id.to_s
  end

  get '/articles/:id' do
    @articles = Article.find(params[:id].to_i)

    erb :show
  end

  delete '/articles/:id/delete' do
    articles = Article.find(params[:id].to_i)
    @name = article.name
    article.destroy

    erb :delete
  end
end
