# == Schema Information
#
# Table name: routes
#
#  id         :uuid             not null, primary key
#  code       :string
#  name       :string
#  status     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_routes_on_code  (code) UNIQUE
#  index_routes_on_name  (name)
#
require "test_helper"

class RouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
