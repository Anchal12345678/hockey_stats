class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :conference, presence: true
  validates :division, presence: true
end