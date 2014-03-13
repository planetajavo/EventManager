
# hemos creado la careta support para que no se nos llene de cosas en spec_helper
# asi en la carpeta support vamos metiendo las configuraciones específicas de la gema
# todo lo q este en esta carpeta lo carga rspec automaticamente

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end