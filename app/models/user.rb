class User < ApplicationRecord
    has_many :carts
    
    validates :name, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]
end
