
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
    params[:articles].each do |article|
      Article.create(article)
    end

    @articles = Article.all 
    binding.pry
    erb :index
  end
end
