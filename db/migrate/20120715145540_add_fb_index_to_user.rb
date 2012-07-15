class AddFbIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :fb_id
  end
end
