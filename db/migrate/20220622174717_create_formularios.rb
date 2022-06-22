class CreateFormularios < ActiveRecord::Migration[6.1]
  def change
    create_table :formularios do |t|
      t.string :nombre_drinker
      t.decimal :estatura_cm
      t.decimal :peso_kg
      t.string :genero
      t.integer :horas_estadia
      t.string :perfil
      t.decimal :presupuesto

      t.timestamps
    end
  end
end
