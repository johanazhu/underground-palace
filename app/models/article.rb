class Article < ApplicationRecord

    validates :title, :description, :body, presence: true
    validates :title, uniqueness: true, on: :create

    belongs_to :user

    has_many :comments, dependent: :destroy
    # has_many :tag, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_and_belongs_to_many :tags
    
    serialize :tagList, Array

    def tagList=(values)
        super(values.reject(&:blank?))
    end
    
    def tagList
        super || []
    end


    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end

    def sync_tags(tag_list)
        p "========================="
        p tag_list
        # tag_list.each do |tag_name|
        #     tag = Tag.find_or_create_bg(name: tag_name)
        #     tags << tag
        # end
    end

end
