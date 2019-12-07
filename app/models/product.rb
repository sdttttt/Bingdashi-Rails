class Product < ApplicationRecord
    has_many :comments
    validates :name , :presence => true , :length => { minimum: 3 } 
end
