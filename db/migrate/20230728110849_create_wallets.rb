class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :uniq_code, default: -> { 'md5((random())::text)' }, null: false, unique: true
      t.integer :credit_in_cents, default: 0
      t.integer :debit_in_cents, default: 0
      t.boolean :status, null: false, default: true

      t.timestamps
    end

    add_index :wallets, %i[user_id uniq_code], unique: true
  end
end
