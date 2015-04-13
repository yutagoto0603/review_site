class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles =>  { medium: "300×300#", thumb: "100×100#" }

  validates_attachment_content_type :avatar,
                                    :content_type => ["image/jpeg", "image/jpg" ,"image/png"]

  validates :nickname, presence: true

  has_many :reviews
end
