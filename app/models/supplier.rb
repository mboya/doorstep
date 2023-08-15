# == Schema Information
#
# Table name: suppliers
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
#  index_suppliers_on_code  (code) UNIQUE
#  index_suppliers_on_name  (name)
#
class Supplier < ApplicationRecord
  has_many :product_suppliers, dependent: :destroy
  has_many :products, through: :product_suppliers
end
