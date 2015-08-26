class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"

	else
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
		

		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ":style/:id_:filename",
	validates_attachment_content_type :image, ["image/jpg", "image/jpeg", "image/png", "image/gif"], message: "Only jpeg, png, and gif images types are allowed"
	end
end

