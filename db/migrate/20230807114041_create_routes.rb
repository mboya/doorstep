class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes, id: :uuid do |t|
      t.string :code
      t.string :name
      t.boolean :status, null: false, default: true

      t.timestamps
    end

    add_index :routes, :code, unique: true
    add_index :routes, :name
  end
end
