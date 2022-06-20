class CreateLiquorCoctels < ActiveRecord::Migration[6.1]
  def change
    create_table :liquor_coctels do |t|
      t.references :coctel, null: false, foreign_key: true
      t.references :liquor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
