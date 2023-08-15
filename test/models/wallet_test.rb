# == Schema Information
#
# Table name: wallets
#
#  id              :uuid             not null, primary key
#  credit_in_cents :integer          default(0)
#  debit_in_cents  :integer          default(0)
#  status          :boolean          default(TRUE), not null
#  uniq_code       :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :uuid             not null
#
# Indexes
#
#  index_wallets_on_user_id                (user_id)
#  index_wallets_on_user_id_and_uniq_code  (user_id,uniq_code) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class WalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
