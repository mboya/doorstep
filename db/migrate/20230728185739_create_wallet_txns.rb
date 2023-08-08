class CreateWalletTxns < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_txns, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.string :txn_id, unique: true
      t.integer :amount_in_cents
      t.string :txn_type
      t.boolean :status, null: false, default: true

      t.timestamps
    end

    add_index :wallet_txns, %i[wallet_id txn_id txn_type]
  end
end
