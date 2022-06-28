class CreateLiquorFormularios < ActiveRecord::Migration[6.1]
  def change
    create_table :liquor_formularios do |t|
      t.references :liquor, null: false, foreign_key: true
      t.references :formulario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
