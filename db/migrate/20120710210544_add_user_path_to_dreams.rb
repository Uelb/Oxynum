class AddUserPathToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :user_id, :integer
  end
end
