class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.string :country_code
      t.boolean :status, null: false, default: true

      t.timestamps
    end

    add_index :users, :phone, unique: true
    add_index :users, %i[first_name last_name]
  end
end
