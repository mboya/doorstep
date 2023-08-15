class CreateProductRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_routes, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :route, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :product_routes, %i[product_id route_id], unique: true
  end
end
