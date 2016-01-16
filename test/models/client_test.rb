require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  test 'new client without data' do
    @empty_client = Client.new
    assert_not @empty_client.save
  end

  test 'new client with valid data' do
    @good_client = Client.new do |c|
      c.first_name="test"
      c.last_name="test"
      c.birthday= Date.today
      c.address = "test streeet"
      c.dni=12345678
      c.cuit=12345678901
      c.gender="M"
      c.email="test@test.com"
      c.telephone=22145654352
      c.skype="testSkype"
      c.facebook="testFacebook"
    end

    assert @good_client.save
  end

  test 'new client with invalid data' do
    @bad_client = Client.new do |c|
      c.first_name=123
      c.last_name=123
      c.birthday= "today"
      c.address = 123
      c.dni="12345678"
      c.cuit="12345678901"
      c.gender=
      c.email="te"
      c.telephone="22145654352"
      c.skype=1234
      c.facebook=1234
    end

    assert_not @bad_client.save
  end

  test 'delete client with registered bills' do

    @client_with_bills = clients(:with_bills)

    #amount of bills after deletion
    bill_amount = Bill.count - @client_with_bills.bills.count

    assert_difference('Client.count', -1) do
        @client_with_bills.destroy
    end

    assert_equal(bill_amount, Bill.count)
  end

  test 'delete client without registered bills' do
    @client_without_bills = clients(:one)

    assert_difference('Client.count', -1) do
            @client_without_bills.destroy
        end
  end
end
