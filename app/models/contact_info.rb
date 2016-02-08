class ContactInfo < ActiveRecord::Base
  belongs_to :client
  validates :name, presence: true, length: { minimum: 2 }
  validates :value, presence: true
end
