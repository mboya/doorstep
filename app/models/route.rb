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
class Route < ApplicationRecord
  has_many :product_routes, dependent: :destroy
  has_many :products, through: :product_routes
  has_many :warehouses

  after_create :create_main_whse
  after_create :create_damaged_whse

  private

  def create_main_whse
    Warehouse.create({
                       code: "#{name.downcase}_warehouse",
                       name: "#{name.downcase}_warehouse",
                       route: self
                     })
  end

  def create_damaged_whse
    Warehouse.create({
                       code: "#{name.downcase}_damaged_warehouse",
                       name: "#{name.downcase}_damaged_warehouse",
                       route: self,
                       whse_type: 'damaged'
                     })
  end
end
