class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :warehouse, null: false, foreign_key: true, type: :uuid
      t.integer :quantity, default: 0
      t.integer :available, default: 0
      t.integer :reserved, default: 0

      t.timestamps
    end

    execute <<-SQL
      alter table stocks add constraint quantity check (quantity >= 0);
      alter table stocks add constraint available check (available >= 0);
      alter table stocks add constraint reserved check (reserved >= 0);
    SQL

    add_index :stocks, %i[product_id warehouse_id], unique: true
  end
end
