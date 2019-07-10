
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :"posts/new"
  end

  post '/articles' do
    @article = Article.new({title: params[:title], content: params[:content]})
    @article.save
    redirect "/articles/#{@article.id}"
  end

  patch 'articles/:id' do
    @article = Article.find(params[:id].to_i)

    erb :"posts/show"
  end

  get '/articles/:id/edit' do
    @article = post.find(params[:id].to_i)

    erb :edit
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id].to_i)
    @name = article.name
    @article.destroy

    erb :delete
  end

end
