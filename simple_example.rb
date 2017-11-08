require 'sinatra'
require 'json'

get '/simple_example/hello' do
  content_type :json
  { respuesta: "Hola #{params[:name]}" }.to_json
end

get '/simple_example/monitor' do
  content_type :json
  {
    codigo_estado: 200,
    msj_estado: "OK",
    desc_personalizada_estado: "Servicio opera correctamente"
  }.to_json
end
