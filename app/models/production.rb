class Production < ApplicationRecord
  belongs_to :data_source

  validates :label, presence: true
end
