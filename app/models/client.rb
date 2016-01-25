class Client < ActiveRecord::Base
  has_many :bills, dependent: :destroy
  has_many :contact_infos, dependent: :destroy

  validates_associated :bills
  validates_associated :contact_infos

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :gender, presence: true, length: { is: 1 }
  validates :dni, presence: true, numericality: true, length: { minimum: 7, maximum: 8 }
  validates :cuit, presence: true, numericality: true, length: { minimum: 10, maximum: 11 }

  def age
    dob = self.birthday
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def total_billed_amount_collected_in (year)
   @bills = self.bills.select { |bill| bill.issue_date.year == year };
   total_amount_of @bills
  end

  def amount_of_bills_issued_in (month)
    @bills =  self.bills.select { |bill| bill.issue_date.year == Time.now.utc.to_date.year && bill.issue_date.month == month};
    @bills.count
  end

  def most_bills_issued_people
    people = self.bills.map { |b| b.person }.uniq

    @most_billed = []

    people.each do |person|
      total = person.bills.select { |b| b.client.id == self.id }.inject(0.0) { |sum, bill|  bill.total_amount + sum }
      @most_billed << [person, total]
    end

    @most_billed.sort! { |first, second| second.second <=> first.second }
    return @most_billed.first 5
  end

  def total_amount_of (bills)
    bills.inject(0.0) { |sum, bill|  bill.total_amount + sum }
  end

end
