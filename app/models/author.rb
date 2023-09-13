class Author < ApplicationRecord
    has_many :book

    validates :author_name, presence: true
end
