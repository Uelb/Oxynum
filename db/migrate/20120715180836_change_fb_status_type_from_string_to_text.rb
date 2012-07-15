class ChangeFbStatusTypeFromStringToText < ActiveRecord::Migration
def up
    change_column :users, :fb_status, :text
end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :users, :fb_status, :string
end
end
