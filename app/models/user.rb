class User < ApplicationRecord
  include Clearance::User
  belongs_to  :namespace
  paginates_per 5

  def full_name
    "first name:#{self.first_name}, last name:#{self.last_name}"
  end
  
  # 个人所得税
  def annual_tax
    personal_tax = 0
    self_salary = self.annual_salary.to_i

    case self_salary
    when 0..18200
      personal_tax = 0
    when 18201..37000
      personal_tax = (self_salary - 18200) * 19 / 100
    when 37001..80000
      personal_tax = 3572 +( self_salary - 37000) * 32.5 / 100
    when 80001..180000
      personal_tax = 17547 +( self_salary - 80000 ) * 37 / 100
    end
    if (self_salary >= 180001)
      personal_tax = 54547 +( self_salary - 180000 ) * 45 / 100
    end
  end

end
