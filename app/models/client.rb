
class Client < ActiveRecord::Base
  has_many :bills
  validates_associated :bills
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :gender, presence: true, length: { is: 1 }
  validates :dni, presence: true, numericality: true, length: { minimum: 7, maximum: 8 }
  validates :cuit, presence: true, numericality: true, length: { minimum: 10, maximum: 11 }
  validates :email, presence: true
  validates :telephone, numericality: true, length: { minimum: 5 }

  def age
    dob = self.birthday
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def total_amount_collected_in (year)
   @bills = self.bills.select { |bill| bill.issue_date.year == year };
   total_amount_of @bills
  end

  def amount_of_bills_issued_on (month)
    @bills =  self.bills.select { |bill| bill.issue_date.year == Time.now.utc.to_date.year && bill.issue_date.month == month};
    @bills.count
  end

  def most_bills_issued_people
    @people = self.bills.group(:person).count
    @asd = Array.new
    @asd2 = Array.new
    @people.each do |person|

      @asd << person[0].name
      @asd2 << person[0].bills.inject(0.0) { |sum, bill|  bill.total_amount + sum }
    end

    @asd3 = (0..@asd.length-1).map do | index |
      [@asd[index],@asd2[index]]
    end


    @asd3.sort! { |first, second| second[1] <=> first[1] }

    return @asd3

  end


  def total_amount_of (bills)
    bills.inject(0.0) { |sum, bill|  bill.total_amount + sum }
  end

end
