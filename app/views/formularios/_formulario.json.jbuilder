json.extract! formulario, :id, :nombre_drinker, :estatura_cm, :peso_kg, :genero, :horas_estadia, :perfil, :presupuesto, :created_at, :updated_at
json.url formulario_url(formulario, format: :json)
