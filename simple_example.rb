require 'sinatra'
require 'json'

get '/simple_example/hello' do
  content_type :json
  { respuesta: "Hola #{params[:name]}" }.to_json
end

get '/simple_example/monitor' do
  content_type :json
  if (Time.now.min / 10).even?
    {
      codigo_estado: 200,
      msj_estado: "OK",
      desc_personalizada_estado: "Servicio opera correctamente"
    }.to_json
  else
    sleep 60 # Time out
  end
end
