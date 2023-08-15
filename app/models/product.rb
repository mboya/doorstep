# frozen_string_literal: true

# == Schema Information
#
# Table name: products
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
#  index_products_on_code  (code) UNIQUE
#  index_products_on_name  (name)
#
class Product < ApplicationRecord
  validates :code, :name, presence: true

  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
  has_many :product_routes, dependent: :destroy
  has_many :routes, through: :product_routes
  has_many :product_prices
  has_many :stocks
end
