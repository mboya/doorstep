# == Schema Information
#
# Table name: product_suppliers
#
#  id          :uuid             not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :uuid             not null
#  supplier_id :uuid             not null
#
# Indexes
#
#  index_product_suppliers_on_product_id                  (product_id)
#  index_product_suppliers_on_product_id_and_supplier_id  (product_id,supplier_id) UNIQUE
#  index_product_suppliers_on_supplier_id                 (supplier_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (supplier_id => suppliers.id)
#
class ProductSupplier < ApplicationRecord
  belongs_to :product
  belongs_to :supplier
end
