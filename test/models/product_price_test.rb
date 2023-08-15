# == Schema Information
#
# Table name: product_prices
#
#  id                  :uuid             not null, primary key
#  cost_price_in_cents :integer          default(0)
#  sell_price_in_cents :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_id          :uuid             not null
#  route_id            :uuid             not null
#
# Indexes
#
#  index_product_prices_on_product_id               (product_id)
#  index_product_prices_on_product_id_and_route_id  (product_id,route_id) UNIQUE
#  index_product_prices_on_route_id                 (route_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (route_id => routes.id)
#
require "test_helper"

class ProductPriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
