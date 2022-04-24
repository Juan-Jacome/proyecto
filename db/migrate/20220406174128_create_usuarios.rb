class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.integer :id_usuario
      t.string :nombre
      t.string :apellido
      t.string :correo
      t.string :telefono

      t.timestamps
    end
  end
end
