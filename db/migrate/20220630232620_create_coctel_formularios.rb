class CreateCoctelFormularios < ActiveRecord::Migration[6.1]
  def change
    create_table :coctel_formularios do |t|
      t.references :coctel, null: false, foreign_key: true
      t.references :formulario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
