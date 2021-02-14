class DestroyJob < ApplicationJob
  queue_as :default

  def perform(customer)
    # Do something later
    puts "Start Job"
    customer.destroy
    puts "END JOB"
  end
end
