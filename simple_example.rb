require 'sinatra'
require 'json'
BASE_PATH = File.expand_path(File.dirname(__FILE__)).freeze

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

get '/simple_example/logs' do
  start_date = params[:inicio]
  end_date = params[:fin]
  return send_file(BASE_PATH + '/mocks/mock_default.tar.gz',
                   disposition: :attachment,
                   filename: 'default.tar.gz') if start_date.nil? && end_date.nil?
  send_file(BASE_PATH + '/mocks/mock_dos_dias.tar.gz',
            disposition: :attachment,
            filename: 'range.tar.gz')
end