class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update]

  def show
    @report = Report.new
  end

  def edit
  end

  def update
    redirect_to customer_path(@customer) if @customer.update(strong_params)
  end

  def dispatched
    customer = find_customer_format
    dispatched = Customer.dispatched(customer.dispatched)
    customer.update(dispatched: dispatched)
    redirect_back(fallback_location: root_path)
  end

  def courier
    customer = find_customer_format
    customer.courier = params[:customer][:courier]
    redirect_back(fallback_location: root_path) if customer.save
  end

  def delivered
    customer = find_customer_format
    delivered = Customer.delivered(customer.delivered)
    customer.update(delivered: delivered)
    redirect_back(fallback_location: dispatched_path)
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def find_customer_format
    Customer.find(params[:format])
  end

  def strong_params
    params.require(:customer).permit(:date, :order_num, :name, :address1, :address2, :postcode, :town, :phone_number, :dispatched, :courier, :delivered)
  end
end
