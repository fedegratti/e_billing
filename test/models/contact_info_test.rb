require 'test_helper'

class ContactInfoTest < ActiveSupport::TestCase
  test 'new contact info without validation error' do
    @regular_contact_info = ContactInfo.new do |c|
      c.client_id = Client.take.id
      c.name = "mock"
      c.value = "mock"
    end

    assert @regular_contact_info.save
  end

  test 'new contact info with validation error' do
    @bad_contact_info = ContactInfo.new
    assert_not @bad_contact_info.save
  end
end
