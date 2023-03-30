class Article < ApplicationRecord
    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :tag, dependent: :destroy
end
