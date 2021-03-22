class Api::V1::CustomersController < Api::V1::BaseController
  def create
    @customer = Customer.new(customer_params)
    # @customer.date = Date.today
    render_error unless @customer.save
  end

  private

  def customer_params
    params.require(:customer).permit(:date, :order_num, :name, :email, :phone_number, :address1, :address2, :postcode, :town)
  end

  def render_error
    render json: { errors: @customer.errors.full_messages },
      status: :unprocessable_entity
  end
end
