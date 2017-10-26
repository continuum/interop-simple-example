require 'sinatra'
require 'json'

get '/simple_example/hello' do
  content_type :json
  { respuesta: "Hola #{params[:name]}" }.to_json
end