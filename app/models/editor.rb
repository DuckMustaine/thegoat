class Editor < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :post, presence: true
  validates :tags, presence: true
  validates :user, presence: true

  	def self.search(query)
		where("tags like?", "%#{query}%")
	end
end
