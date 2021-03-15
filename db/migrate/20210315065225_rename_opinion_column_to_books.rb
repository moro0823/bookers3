class RenameOpinionColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :opinion, :body
  end
end
