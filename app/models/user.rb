class User < ApplicationRecord
  validates :username , presence: true , length: { minimum: 4 , maximum: 20 }
  validates :password , presence: true , length: { minimum: 7 , maximum: 24 }
end
