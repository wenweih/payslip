class User < ApplicationRecord
  include Clearance::User
  has_one :namespace, foreign_key: :owner_id
  belongs_to  :namespace
  paginates_per 2
end
