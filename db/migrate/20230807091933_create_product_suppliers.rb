class CreateProductSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :product_suppliers, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :supplier, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :product_suppliers, %i[product_id supplier_id], unique: true
  end
end
