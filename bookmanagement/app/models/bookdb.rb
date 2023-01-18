class Bookdb < ApplicationRecord
    validates :bookName, presence: true
    validates :bookAuthor, presence: true
    validates :bookName, uniqueness: true
end