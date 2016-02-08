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
      c.dni=12345678
      c.cuit=12345678901
      c.gender="M"
    end

    assert @good_client.save
  end

  test 'new client with invalid data' do
    @bad_client = Client.new do |c|
      c.first_name=
      c.last_name=1
      c.birthday= "today"
      c.dni="asd"
      c.cuit="asd"
      c.gender=""
    end

    assert_not @bad_client.save
  end

  test 'delete client with registered bills' do

    @client_with_bills = clients(:with_bills)

    #amount of bills after deletion
    bills_amount = Bill.count - @client_with_bills.bills.count

    assert_difference('Client.count', -1) do
        @client_with_bills.destroy
    end

    assert_equal(bills_amount, Bill.count)
  end

  test 'delete client without registered bills' do
    @client_without_bills = clients(:one)

    assert_difference('Client.count', -1) do
            @client_without_bills.destroy
        end
  end

  test 'delete client with registered contact infos' do
    @client_with_contact_infos = clients(:with_contact_infos)

      #amount of contact infos after deletion
      contact_infos_amount = ContactInfo.count - @client_with_contact_infos.contact_infos.count

      assert_difference('Client.count', -1) do
          @client_with_contact_infos.destroy
      end

      assert_equal(contact_infos_amount, ContactInfo.count)
  end
end
