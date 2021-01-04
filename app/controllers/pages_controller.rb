class PagesController < ApplicationController
  def home
    @items_import = ItemsImport.new
    # Filter the new entries up to 18 hours since they are created
    @new_customers = Customer.order(:created_at).select { |customer| timer(customer.created_at) < 36 }
    @customers_unready = Customer.select { |customer| timer(customer.created_at) > 18 && customer.ready == false }
    @customers_reports = Customer.select { |customer| customer.reports.count.positive? }
  end

  private

  def timer(created)
    return ((Time.now - created) / 3600).to_i
  end
end
