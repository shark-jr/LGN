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


  has_and_belongs_to_many :games

  # has_and_belongs_to_many :events

  has_attached_file :profile_img, :styles => { medium: "300x300#", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_img, :content_type => /\Aimage\/.*\Z/

  has_and_belongs_to_many :events, through: :events_users
  has_many :events_users

end
