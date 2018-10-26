class Article < ApplicationRecord
	validates_presence_of :title, message: "must be present"
	validates :title, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
end
