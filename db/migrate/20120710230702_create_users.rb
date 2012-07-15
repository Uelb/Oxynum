class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :gender
      t.string :username
      t.string :ip
      t.integer :fb_id
      t.string :fb_first_name
      t.string :fb_last_name
      t.string :location
      t.string :fb_status
      t.date :birthday

      t.timestamps
    end
  end
end
