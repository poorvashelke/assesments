# == Schema Information
#
# Table name: ideologies
#
#  id         :integer          not null, primary key
#  name       :string
#  direction  :string
#  goal       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ideology < ApplicationRecord

  has_many :parties, 
  primary_key: :id,
  foreign_key: :ideology_id,
  class_name: :Party 

  has_many :subscribing_senators,
  through: :parties,
  source: :senators
end
