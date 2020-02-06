class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pro_image_id, :string
    add_column :users, :introdution, :text
  end
end
