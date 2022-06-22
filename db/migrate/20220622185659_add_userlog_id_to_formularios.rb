class AddUserlogIdToFormularios < ActiveRecord::Migration[6.1]
  def change
    add_column :formularios, :userlog_id, :integer
    add_index :formularios, :userlog_id
  end
end
