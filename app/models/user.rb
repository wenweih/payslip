class User < ApplicationRecord
  include Clearance::User
  belongs_to  :namespace
  paginates_per 5
end
