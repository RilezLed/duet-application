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
end
