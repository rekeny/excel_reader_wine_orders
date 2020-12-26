class ItemsImportsController < ApplicationController
  def create
    items_import = ItemsImport.create(file: strong_params.path)
    # raise
    if strong_params.original_filename.split('.').last == 'xlsx'
      data = Roo::Spreadsheet.open(items_import.file)
      headers = data.row(1)
      data.each_with_index do |row, idx|
        next if idx.zero?

        user_data = Hash[[headers, row].transpose]

        customer = order_exist(user_data)
        product = product(user_data['Description'])
        order = create_order(customer, product, user_data['Qty'])
        order.customer = customer
        items_import.destroy
        next if order.save!
      end
      redirect_to root_path
    else
      flash[:alert] = "Unknown file type: #{strong_params.original_filename}"
    end
  end

  private

  def strong_params
    params.require(:items_import).require(:filepath)
  end

  def order_exist(user_data)
    if Customer.exists?(order_num: user_data['Order No'])
      Customer.find_by(order_num: user_data['Order No'])
    else
      customer = Customer.new(date: user_data['Date'], order_num: user_data['Order No'], name: user_data['Name'], email: user_data['Email'], phone_number: user_data['Contact No'], address1: user_data['Address 1'], address2: user_data['Address 2'], postcode: user_data['Postcode'], town: user_data['Town'])
      customer.save!
      return customer
    end
  end

  def create_order(customer, product, quantity)
    Order.new(quantity: quantity, customer_id: customer.id, product_id: product.id)
  end

  def product(description)
    if Product.exists?(description: description)
      product = Product.find_by(description: description)
    else
      product = Product.new(description: description)
      product.save!
    end
    return product
  end
end
