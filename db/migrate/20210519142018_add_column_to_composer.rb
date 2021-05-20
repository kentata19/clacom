class AddColumnToComposer < ActiveRecord::Migration[6.0]
  def change
    add_column :composers, :profile_photo, :string
  end
end
