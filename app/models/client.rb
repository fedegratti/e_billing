
class Client < ActiveRecord::Base
  has_many :bills
  validates_associated :bills
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :gender, presence: true
  validates :dni, presence: true, numericality: true, length: { minimum: 7, maximum: 8 }
  validates :cuit, presence: true, numericality: true, length: { minimum: 10, maximum: 11 }
  validates :email, presence: true
  validates :telephone, numericality: true
end
