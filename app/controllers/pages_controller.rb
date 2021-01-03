class PagesController < ApplicationController
  def home
    @items_import = ItemsImport.new
    # Filter the new entries up to 18 hours since they are created
    @new_customer = Customer.select { |customer| timer(customer.created_at) < 18 }

  end

  private

  def timer(created)
    return ((Time.now - created) / 3600).to_i

  end
end
