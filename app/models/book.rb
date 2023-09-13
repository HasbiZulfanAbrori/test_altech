class Book < ApplicationRecord
    belongs_to :author

    validates :title, presence: { message: "can't be blank" }, length: { maximum: 50 }
    validates :publication_year, presence: { message: "can't be blank" }, length: { is: 4 }
    validates :author_id, presence: { message: "author must be assigned" }
end
