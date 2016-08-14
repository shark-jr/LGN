class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :profile_img_file_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            uniqueness: true ,
            presence: true,
            length: {minimum: 3, maximum: 16}
  validates :zip, presence: true,
            numericality: {only_integer: true}

  has_many :games_users
  has_many :games, through: :games_users

  # has_and_belongs_to_many :events

  has_attached_file :profile_img, :styles => { medium: "300x300#", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_img, :content_type => /\Aimage\/.*\Z/

  has_and_belongs_to_many :events, through: :events_users
  has_many :events_users

  geocoded_by :zip
  after_save :geocode
  after_validation :geocode
    STATES = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
end
