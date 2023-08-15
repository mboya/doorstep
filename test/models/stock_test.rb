# == Schema Information
#
# Table name: stocks
#
#  id           :uuid             not null, primary key
#  available    :integer          default(0)
#  quantity     :integer          default(0)
#  reserved     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :uuid             not null
#  warehouse_id :uuid             not null
#
# Indexes
#
#  index_stocks_on_product_id                   (product_id)
#  index_stocks_on_product_id_and_warehouse_id  (product_id,warehouse_id) UNIQUE
#  index_stocks_on_warehouse_id                 (warehouse_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (warehouse_id => warehouses.id)
#
require "test_helper"

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
