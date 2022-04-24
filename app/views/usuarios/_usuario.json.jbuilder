json.extract! usuario, :id, :id_usuario, :nombre, :apellido, :correo, :telefono, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
