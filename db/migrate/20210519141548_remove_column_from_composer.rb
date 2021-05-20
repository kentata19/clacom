class RemoveColumnFromComposer < ActiveRecord::Migration[6.0]
  def change
    remove_column :composers, :profile_photo, :string
  end
end
