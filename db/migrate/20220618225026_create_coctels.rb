class CreateCoctels < ActiveRecord::Migration[6.1]
  def change
    create_table :coctels do |t|
      t.string :nombre_coctel
      t.decimal :gramos_alcohol

      t.timestamps
    end
  end
end
