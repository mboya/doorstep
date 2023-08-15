class AddConstraintToWallet < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      alter table wallets add constraint credit_in_cents check (credit_in_cents >= 0);
      alter table wallets add constraint debit_in_cents check (debit_in_cents >= 0);
    SQL
  end
end
