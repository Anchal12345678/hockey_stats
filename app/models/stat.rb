class Stat < ApplicationRecord
  belongs_to :player

  validates :season, presence: true
  validates :games_played, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :goals, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :assists, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
end