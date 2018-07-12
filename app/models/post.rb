class Post < ActiveRecord::Base
    has_many :replies
    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user #likes에서 user값을 가져옴! 그것이 liked_users이다.
    
    validates :title, presence: true
end
