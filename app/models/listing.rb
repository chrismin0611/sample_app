class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
		validates_attachment :image, 
		:image_content_type => { :content_type => ['image/jpg', 'image/jpeg', 'image/png']}, :message => 'file type is not allowed (only jpeg/png/gif images)'


	else
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ":style/:id_:filename"
		validates_attachment :image, 
		:image_content_type => { :content_type => ['image/jpg', 'image/jpeg', 'image/png']}, :message => 'file type is not allowed (only jpeg/png/gif images)'

	end
end

