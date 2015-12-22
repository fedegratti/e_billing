require 'rspec'

describe 'New client' do

  setup do
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

    @empty_client = Client.new
  end

  it 'without data' do
    expect(false).to eq(@bad_client.save)
  end

  it 'with data' do

    @good_client.save!

  end

  it 'with invalid data' do
    expect(false).to eq(@empty_client.save)
  end
end