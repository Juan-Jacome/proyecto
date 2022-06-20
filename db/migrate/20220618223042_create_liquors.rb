class CreateLiquors < ActiveRecord::Migration[6.1]
  def change
    create_table :liquors do |t|
      t.string :nombre_licor
      t.string :marca
      t.decimal :grados_alcohol

      t.timestamps
    end
  end
end
