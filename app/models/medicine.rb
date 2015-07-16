class Medicine < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :medical_records
end