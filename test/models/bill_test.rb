require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test 'new bill without validation error' do
   @regular_bill = Bill.new do |b|
      b.client_id = Client.take.id
      b.person_id = Person.take.id
      b.description = "mock"
      b.issue_date = Date.today
      b.total_amount = 123
    end
    assert @regular_bill.save
  end

  test 'new bill with validation error' do
   @bad_bill = Bill.new
   assert_not @bad_bill.save
  end
end
