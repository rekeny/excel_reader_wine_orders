class DestroyJob < ApplicationJob
  queue_as :default

  def perform(customer)
    emails = ['fernando.requeni@outlook.com', 'fernando.requeni@tate.org.uk']
    # Do something later
    puts "Start Job"
    emails.each do |email|
      CustomerMailer.with(email: email).destroy(customer).deliver_now
    end
    customer.destroy
    puts "END JOB"
  end
end
