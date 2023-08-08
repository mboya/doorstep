# frozen_string_literal: true

class Product < ApplicationRecord
  validates :code, :name, presence: true
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
end
