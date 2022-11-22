class Author < ApplicationRecord
    # all authors have a name and no name can repeated
    validates :name, presence: true, uniqueness: true
    # number is exactly 10 digits
    validates :phone_number, length: {is: 10}
end
