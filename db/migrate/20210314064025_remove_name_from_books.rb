class RemoveNameFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :body, :string
  end
end
