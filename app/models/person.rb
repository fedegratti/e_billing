class Person < ActiveRecord::Base
  has_many :bills, dependent: :destroy
  validates_associated :bills
  validates :name, presence: true, length: { minimum: 2 }
  validates :cuit, presence: true, numericality: true, length: { minimum: 10, maximum: 11 }
  validates :legal, presence: true, length: { is: 1 }
end
