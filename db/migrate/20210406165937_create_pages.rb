class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :models_name
      t.string :models_instagram
      t.integer :image_height
      t.integer :image_width
      t.integer :number_rows_desktop
      t.integer :number_rows_mobile
      t.boolean :is_slider

      t.timestamps
    end
  end
end
