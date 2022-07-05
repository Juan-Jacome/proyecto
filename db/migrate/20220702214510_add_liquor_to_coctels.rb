class AddLiquorToCoctels < ActiveRecord::Migration[6.1]
  def change
    add_column :coctels, :liquor, :string
  end
end
