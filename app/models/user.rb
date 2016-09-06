class User < ApplicationRecord
  include Clearance::User
  has_one :namespace, foreign_key: :owner_id
end
