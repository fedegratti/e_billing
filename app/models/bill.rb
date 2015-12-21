
class Bill < ActiveRecord::Base
  belongs_to :client
  belongs_to :person
  validates :total_amount, presence: true
end