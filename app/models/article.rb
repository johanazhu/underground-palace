class Article < ApplicationRecord
    before_save :generate_slug

    validates :title, :description, :body, presence: true
    validates :title, uniqueness: true, on: :create

    belongs_to :user

    has_many :comments, dependent: :destroy
    # has_many :tag, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_and_belongs_to_many :tags

    def tag_list
        tags.map(&:name).to_json
    end
    
    def sync_tags(tag_list)
        
        tagArr = JSON.parse(tag_list)
        # 如果已经有标签，则更新标签列表
        if tags.any?
            # 删除原有标签
            tags.destroy_all
        end
        tagArr.each do |tag_name|
            tag = Tag.find_or_create_by(name: tag_name)

            tags << tag
        end
    end

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end

    private

    def generate_slug
        self.slug = title.parameterize
    end

end
