# == Schema Information
#
# Table name: duets
#
#  id         :integer          not null, primary key
#  looking    :boolean
#  private    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer
#  song_id    :integer
#
class Duet < ApplicationRecord
  has_many(:members, { :class_name => "Member", :foreign_key => "duet_id" })
  belongs_to(:creator, {
    :class_name => "User",
    :foreign_key => "creator_id"
  })

  belongs_to(:song, {
    :class_name => "Song",
    :foreign_key => "song_id"
  })
end
