class AddNameToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :name, :string
  end
end
