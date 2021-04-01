class Api::V1::OrdersController < Api::V1::BaseController
  def create
    @order = Order.new(customer_params)
    @product = get_product(params[:order][:product])
    @customer = Customer.find_by(name: params[:order][:customer])
    p @order
    # @order.quantity = params[:order][:quantity]
    @order.customer_id = @customer.id
    @order.product_id = @product.id
    render_error unless @order.save
  end

  def destroy_order
    @customer = Customer.find_by(name: params[:order][:customer])
    p @customer
    @product = Product.find_by(description: params[:order][:product])
    p @product
    @order = Order.find_by(customer_id: @customer.id, product_id: @product.id)
    @order.destroy
  end

  private

  def customer_params
    params.require(:order).permit(:quantity)
  end

  def render_error
    render json: { errors: @order.errors.full_messages },
      status: :unprocessable_entity
  end

  def get_product(product)
    @product = Product.find_by(description: product) ? Product.find_by(description: product) : Product.create(description: product)
  end
end
