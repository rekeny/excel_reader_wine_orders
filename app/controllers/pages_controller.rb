class PagesController < ApplicationController
  def home
    @items_import = ItemsImport.new
    # Filter the new entries up to 18 hours since they are created
    @new_customers = Customer.order(:created_at).select { |customer| timer(customer.created_at) < 36 }
    @customers_unready = Customer.select { |customer| timer(customer.created_at) > 18 && customer.ready == false }
  end

  private

  def timer(created)
    return ((Time.now - created) / 3600).to_i
  end
end
