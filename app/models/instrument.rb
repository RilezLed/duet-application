# == Schema Information
#
# Table name: instruments
#
#  id              :integer          not null, primary key
#  genre           :string
#  instrument_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Instrument < ApplicationRecord
end
