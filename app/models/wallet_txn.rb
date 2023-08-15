# == Schema Information
#
# Table name: wallet_txns
#
#  id              :uuid             not null, primary key
#  amount_in_cents :integer
#  status          :boolean          default(TRUE), not null
#  txn_type        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  txn_id          :string
#  wallet_id       :uuid             not null
#
# Indexes
#
#  index_wallet_txns_on_wallet_id                          (wallet_id)
#  index_wallet_txns_on_wallet_id_and_txn_id_and_txn_type  (wallet_id,txn_id,txn_type)
#
# Foreign Keys
#
#  fk_rails_...  (wallet_id => wallets.id)
#
class WalletTxn < ApplicationRecord
  belongs_to :wallet
end
