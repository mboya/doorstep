class CreateProductPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :product_prices, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :route, null: false, foreign_key: true, type: :uuid
      t.integer :cost_price_in_cents, default: 0
      t.integer :sell_price_in_cents, default: 0

      t.timestamps
    end

    execute <<-SQL
      alter table product_prices add constraint cost_price_in_cents check (cost_price_in_cents > 0);
      alter table product_prices add constraint sell_price_in_cents check (sell_price_in_cents > 0);
    SQL

    add_index :product_prices, %i[product_id route_id], unique: true
  end
end
