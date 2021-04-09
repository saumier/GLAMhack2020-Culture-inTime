class DataSource < ApplicationRecord
  has_many :productions, dependent: :destroy
end
