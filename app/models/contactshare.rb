class Contactshare < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => [:contact_id]

	belongs_to :contact
	belongs_to :user
end
