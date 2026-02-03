class Book < ApplicationRecord
    validates :title, presence: true # I just didnt like how it accepts empty string
    validates :author, presence: true
    validates :price, presence:true, numericality: {only_integer: true}
    validates :published_date, presence: true


end
