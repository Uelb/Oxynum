class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :message

      t.timestamps
    end
  end
end
