class AddProductInfosToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :brand_name, :string
    add_column :invoices, :product_name, :string
    add_column :invoices, :product_category, :string
  end
end
