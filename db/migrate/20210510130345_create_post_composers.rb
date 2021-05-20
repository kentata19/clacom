class CreatePostComposers < ActiveRecord::Migration[6.0]
  def change
    create_table :post_composers do |t|
      t.references :post, foreign_key: true, null: false
      t.references :composer, foreign_key: true, null: false
      t.timestamps
    end
  end
end
