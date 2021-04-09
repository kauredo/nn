class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.text :image
      t.boolean :main, default: false
      t.integer :order
      t.references :page
      t.timestamps
    end
  end
end
