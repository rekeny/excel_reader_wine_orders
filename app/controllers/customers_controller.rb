class CustomersController < ApplicationController
  # protect_from_forgery except: [:courier]
  def show
    @customer = Customer.find(params[:id])
    @report = Report.new
  end

  def edit
    @customer = find_customer(params[:id])
  end

  def update
    @customer = find_customer(params[:id])
    redirect_to customer_path(@customer) if @customer.update(strong_params)
  end

  def ready
    customer = find_customer(params[:format])
    ready = Customer.ready(customer.ready)
    customer.update(ready: ready)
    redirect_back(fallback_location: root_path)
  end

  def courier
    customer = find_customer(params[:format])
    customer.courier = params[:customer][:courier]
    redirect_back(fallback_location: root_path) if customer.save
  end

  private

  def find_customer(id)
    Customer.find(id)
  end

  def strong_params
    params.require(:customer).permit(:date, :order_num, :name, :address1, :address2, :postcode, :town, :phone_number, :ready, :courier)
  end
end
