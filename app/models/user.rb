class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :carts, dependent: :destroy
    
    validates :name, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]

    has_one_attached :profile_picture
 end

 /testando branch
