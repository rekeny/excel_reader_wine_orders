require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "destroy" do
    mail = CustomerMailer.destroy
    assert_equal "Destroy", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
