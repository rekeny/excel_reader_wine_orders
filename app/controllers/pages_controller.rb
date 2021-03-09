class PagesController < ApplicationController
  def home
    @items_import = ItemsImport.new
    @name = User.find_by(email: cookies['email']).name unless cookies['email'].nil?
    # Filter the new entries up to 18 hours since they are created
    @new_customers = Customer.order(:created_at).select { |customer| timer(customer.created_at) < 18 }
    @customers_unready = Customer.order(:created_at).select { |customer| timer(customer.created_at) >= 18 && customer.dispatched == false }
    @customers_reports = Customer.order(:created_at).select { |customer| customer.reports.count.positive? }
  end

  def dispatched
    @customers_dispatched = Customer.order(:date).select { |customer| customer.dispatched && customer.delivered == false }
    @customers_delivered = Customer.order('date DESC').select { |customer| customer.delivered }
  end

  private

  def timer(created)
    return ((Time.now - created) / 3600).to_i
  end
end
