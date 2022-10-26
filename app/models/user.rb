class User < ApplicationRecord
    has_many :carts, dependent: :destroy
    
    validates :name, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]
end
