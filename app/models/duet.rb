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
end
