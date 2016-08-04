class AddCatsColumn < ActiveRecord::Migration
  def change
    add_column :cats, :user_id
  end
end
