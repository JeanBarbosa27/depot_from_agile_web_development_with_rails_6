class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url

      # The options below sets 8 decimal digits of significance for calculations
      # but just 2 digits to render
      t.decimal :price, precision: 8, scale: 2 

      t.timestamps
    end
  end
end
