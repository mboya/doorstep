# frozen_string_literal: true
class CreateSupplier < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers, id: :uuid do |t|
      t.string :code
      t.string :name
      t.boolean :status, null: false, default: true

      t.timestamps
    end

    add_index :suppliers, :code, unique: true
    add_index :suppliers, :name
  end
end
