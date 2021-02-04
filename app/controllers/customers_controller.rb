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
    customer = Customer.find(params[:format])
    dispatched = Customer.dispatched(customer.dispatched)
    customer.update(dispatched: dispatched)
    redirect_back(fallback_location: root_path)
  end

  def courier
    customer = Customer.find(params[:format])
    customer.courier = params[:customer][:courier]
    redirect_back(fallback_location: root_path) if customer.save
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def strong_params
    params.require(:customer).permit(:date, :order_num, :name, :address1, :address2, :postcode, :town, :phone_number, :dispatched, :courier)
  end
end
