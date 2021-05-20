class AddColumnToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :circumstance, :string
    add_column :posts, :configuration, :string
    add_column :posts, :organization, :string
    add_column :posts, :column, :string
    add_column :posts, :quotation, :string
  end
end
