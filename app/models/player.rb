class Player < ApplicationRecord
  belongs_to :team
  has_many :stats, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :nationality, presence: true
end