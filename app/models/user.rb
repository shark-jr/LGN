class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            uniqueness: true ,
            presence: true,
            length: {minimum: 3, maximum: 16}


         has_and_belongs_to_many :games
         has_and_belongs_to_many :events

# geocoded_by :ip_address,
# :latitude => :lat, :longitude => :lon
# after_validation :geocode

end
