class CreateDreamWords < ActiveRecord::Migration
  def change
    create_table :dream_words do |t|
      t.string :word
      t.integer :dream_id

      t.timestamps
    end
  end
end
