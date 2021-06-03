# == Schema Information
#
# Table name: requests
#
#  id            :integer          not null, primary key
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  group_id      :integer
#  instrument_id :integer
#  requestor_id  :integer
#
class Request < ApplicationRecord
  belongs_to(:requester, {
    :class_name => "User",
    :foreign_key => "requester_id",
    :required => true
  })
  belongs_to(:group, {
    :class_name => "member",
    :foreign_key => "group_id",
    :required => true
  })

  

end
