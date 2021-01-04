class CustomersController < ApplicationController
  # protect_from_forgery except: [:courier]
  def show
    @customer = Customer.find(params[:id])
    @report = Report.new
  end

  def ready
    customer = find_customer(params[:format])
    ready = Customer.ready(customer.ready)
    customer.update(ready: ready)
    redirect_to root_path
  end

  def courier
    customer = find_customer(params[:format])
    customer.courier = params[:customer][:courier]
    customer.save
    redirect_to root_path
  end

  private

  def find_customer(id)
    Customer.find(id)
  end
end
