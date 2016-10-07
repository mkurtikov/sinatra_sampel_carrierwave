require 'sinatra'
require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/json'
require 'mongoid'
require 'dotenv'
require 'sinatra-initializers'
require 'carrierwave/mongoid'
require 'active_model_serializers'
require 'mini_magick'
require './uploaders/image_uploader'
require './models/task'
require 'require_all'

require_all 'serializers'

Dotenv.load

class App < Sinatra::Application
  register Sinatra::Initializers
  configure do
    set :raise_sinatra_param_exceptions, true
    set show_exceptions: false
    set :public_folder, 'uploads'
  end

  post '/tasks' do
    param :task,   String, in: ['resize'],  required: true
    param :image,  String, required: true
    param :params, Hash, required: true

    task = Task.new(params)
    task.remote_image_url = params[:image]
    task.save

    json task
  end

  error Mongoid::Errors::DocumentNotFound do
    status 404
    { error: "Not found" }.to_s
  end

  error Sinatra::Param::InvalidParameterError do
    status 422
    { error: "#{env['sinatra.error'].param} is invalid" }.to_json
  end
end
