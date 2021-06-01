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
end
