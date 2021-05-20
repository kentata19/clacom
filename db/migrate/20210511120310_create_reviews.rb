class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :caption
      t.string :instrument
      t.string :orchestra
      t.string :performance
      t.timestamps
    end
  end
end
