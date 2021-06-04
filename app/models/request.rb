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
    :foreign_key => "requestor_id",
    :required => true
  })
  belongs_to(:group, {
    :class_name => "Member",
    :foreign_key => "group_id",
    :required => true
  })

 belongs_to(:instrument, {
    :class_name => "Instrument",
    :foreign_key => "instrument_id",
  })

  

end
