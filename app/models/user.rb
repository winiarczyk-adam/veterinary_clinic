class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: 'mm', secure: true, rating: 'PG'

  enum role: [ :patient, :veterinarian, :admin ]

  has_one :address
  has_one :veterinarian
  has_many :medical_record
  has_many :animals
  has_many :appointments

  accepts_nested_attributes_for :address

  validates_presence_of :first_name, :last_name, :pesel
  validates :pesel, length: { is: 11 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
