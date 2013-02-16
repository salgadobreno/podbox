$:.unshift(File.expand_path('./lib'))

require 'sinatra'
require 'rack-flash'
require 'resque'
require 'sound_tuber'

class SoundTuberApp < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end

  post '/' do
    if params[:url] && params[:url].size > 0
      Resque.enqueue(SoundTuber, params[:url])
      flash[:success] = "<strong>You rock!</strong> Your MP3 will be available soon considering the url is valid!"
    else
      flash[:error] = "<strong>Error!</strong> Did you forget the video URL?"
    end
    erb :index
  end

end

SoundTuberApp.run!
