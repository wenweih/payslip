class User < ApplicationRecord
  include Clearance::User
  belongs_to  :namespace
  paginates_per 5

  def full_name
    "first name:#{self.first_name}, last name:#{self.last_name}"
  end
end
