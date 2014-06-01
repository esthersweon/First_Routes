# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Contact < ActiveRecord::Base
  validates :user_id, :name, :email, presence: true
  validates :email, uniqueness: true

  belongs_to :user
  has_many :contact_shares

  has_many :shared_users, through: :contact_shares, source: :users

  def self.contacts_for_user_id(user_id)
   #    query = <<-SQL
   #    SELECT DISTINCT contacts.*
   #    FROM contacts
   #    LEFT OUTER JOIN contact_shares
   #    ON contacts.id = contact_shares.contact_id
   #    WHERE
   #    contact.user_id = ? OR contact_shares.user_id = ?
   #    SQL
   #
   #    Contact.find_by_sql([query, user_id])

   joins_cond = <<-SQL
     LEFT OUTER JOIN contact_shares
     ON contacts.id = contact_shares.contact_id
     SQL

   where_cond = <<-SQL
     ((contacts.user_id = :user_id) OR (contact_shares.user_id = :user_id))
     SQL

   Contact.
   joins(joins_cond).
   where(where_cond, :user_id => user_id).
   uniq

  end
end
