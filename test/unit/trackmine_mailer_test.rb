require File.dirname(__FILE__) + '/../test_helper'

class TrackmineMailerTest < ActionMailer::TestCase
  tests TrackmineMailer

  test "trackmine error email" do
    email = TrackmineMailer.deliver_error_mail("Something wrong: " + Exception.new('really wrong'))
    assert !ActionMailer::Base.deliveries.empty? 

    assert_equal ["piotrek@therock.pl"], email.to 
    assert_equal "Trackmine error occurred", email.subject 
    assert_match /Got error from Trackmine/, email.body
    assert_match /really wrong/, email.body  
  end
end
