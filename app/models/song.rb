# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  band       :string
#  genre      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Song < ApplicationRecord
end
