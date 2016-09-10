class Namespace < ApplicationRecord
  belongs_to :leader, class_name: "User", foreign_key: :owner_id
  validates :name, presence: true,  uniqueness: true
  has_many :users
end
