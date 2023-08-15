# frozen_string_literal: true

# == Schema Information
#
# Table name: warehouses
#
#  id         :uuid             not null, primary key
#  code       :string
#  name       :string
#  status     :boolean
#  whse_type  :enum             default("main"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  route_id   :uuid             not null
#
# Indexes
#
#  index_warehouses_on_code_and_name  (code,name)
#  index_warehouses_on_route_id       (route_id)
#
# Foreign Keys
#
#  fk_rails_...  (route_id => routes.id)
#
class Warehouse < ApplicationRecord
  belongs_to :route
  has_many :stocks
end
