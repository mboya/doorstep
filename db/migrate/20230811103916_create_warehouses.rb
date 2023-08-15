class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_enum :w_type, %w[main transit damaged]

    create_table :warehouses, id: :uuid do |t|
      t.string :code
      t.string :name
      t.boolean :status
      t.references :route, null: false, foreign_key: true, type: :uuid
      t.enum :whse_type, enum_type: 'w_type', default: 'main', null: false

      t.timestamps
    end

    add_index :warehouses, %i[code name]
  end
end
