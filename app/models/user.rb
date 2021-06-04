# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:talents, { :class_name => "Talent", :foreign_key => "musician_id" })
  has_many(:duets, { :class_name => "Duet", :foreign_key => "creator_id" })
  has_many(:groups, { :class_name => "Member", :foreign_key => "bandmate_id" })
 
end
