class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    # validate is used for custom error messages
    validate :title_clickbait

    def title_clickbait
        # \d+ -> one or more digits eg.Top 234
        # if the title does not match the words the brackets throw the error
        unless self.title && self.title.match(/Won't Believe | Secret |Top \d+| Guess/)
            errors.add(:title, "is not sufficiently clickbait-y")
        end
    end
end
