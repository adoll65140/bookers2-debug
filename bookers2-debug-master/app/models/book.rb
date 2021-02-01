class Book < ApplicationRecord
	belongs_to :user
	#9 has_many :user=>belongs_to :user
	#21 9ではなく21の作業

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
