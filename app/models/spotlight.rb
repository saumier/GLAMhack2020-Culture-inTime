class Spotlight < ApplicationRecord
  has_and_belongs_to_many :data_sources

  validates :title, :description, :location, :subtitle, presence: true
end
