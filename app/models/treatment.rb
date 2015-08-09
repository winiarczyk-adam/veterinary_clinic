class Treatment < ActiveRecord::Base
  has_and_belongs_to_many :medical_records

  validates_presence_of :name, :cost
  validates_numericality_of :cost, greater_than_or_equal_to: 0
  validates_format_of :cost, with: /\A\d+(?:\.\d{0,2})?\z/

  def custom_label_method
    "##{id} #{name}"
  end

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end
