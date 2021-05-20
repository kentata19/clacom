class CreateComposers < ActiveRecord::Migration[6.0]
  def change
    create_table :composers do |t|
      t.string     :name, null: false
      t.string     :profile_photo, null: false
      t.text       :information
      t.timestamps
    end
  end
end
