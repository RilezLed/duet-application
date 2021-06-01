# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  open          :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bandmate_id   :integer
#  duet_id       :integer
#  instrumnet_id :integer
#
class Member < ApplicationRecord
end
