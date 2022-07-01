class CreateRecomendacions < ActiveRecord::Migration[6.1]
  def change
    create_table :recomendacions do |t|
      t.references :liquor_coctel, null: false, foreign_key: true
      t.references :formulario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
