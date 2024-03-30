class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    
    validates :title, presence: true
    validates :name, presence: true
    validates :content, presence: true, length: {minimum:3}
end
