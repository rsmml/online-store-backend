class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description
      t.integer :stock
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
