
class Bill < ActiveRecord::Base
  belongs_to :client
  belongs_to :person
end