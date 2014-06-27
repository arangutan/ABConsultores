json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :nombre_comercial, :razon_social, :nit, :representante_legal, :nombre_contacto, :email_contacto, :telefono_contacto, :direccion_contacto, :ciudad, :pais, :pagina_web, :imagen
  json.url empresa_url(empresa, format: :json)
end
