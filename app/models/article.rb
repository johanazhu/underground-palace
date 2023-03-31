class Article < ApplicationRecord
    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :tag, dependent: :destroy
    has_many :likes, dependent: :destroy


    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end
    # def like?(other_user)
    #     users.include?(other_user)
    # end

    # def like(user)
    #     users << user unless users.include? user
    # end

    # def unlike(user)
    #     users.delete user
    # end

end
