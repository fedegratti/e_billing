class ContactInfo < ActiveRecord::Base
  belongs_to :client
  validates :name, :value, presence: true
end
