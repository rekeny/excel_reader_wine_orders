namespace :customer do
  desc "Destroy all the orders delivered after 2 weeks"
  task destroy_old: :environment do
    orders = Customer.all.select { |customer| ((Time.now - customer.date) / (3600 * 24)) > 7 && customer.delivered }
    puts "TRYING!!!!!!"
    puts orders
    orders.each do |order|
      DestroyJob.perform_later(order)
    end
  end
end
