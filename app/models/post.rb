class Post < ActiveRecord::Base
    has_many :replies
    validates :title, presence: {message: "제목을 적어쥬세요~"}
    
end
