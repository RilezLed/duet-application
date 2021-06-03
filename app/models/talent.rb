# == Schema Information
#
# Table name: talents
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instrument_id :integer
#  musician_id   :integer
#
class Talent < ApplicationRecord
  belongs_to(:musician, {
    :class_name => "User",
    :foreign_key => "musician_id",
    :required => true
  })

  belongs_to(:instrument, {
    :class_name => "Instrument",
    :foreign_key => "instrument_id",
    :required => true
  })
end
