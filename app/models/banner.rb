class Banner < ApplicationRecord
	acts_as_list
	validates :avatar, attachment_presence: true
	has_attached_file :avatar, styles: 
		{ 
			big: "1000x250^", small: "200x50>" 
		}, 
		default_url: "/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end