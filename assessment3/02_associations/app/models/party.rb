# == Schema Information
#
# Table name: parties
#
#  id              :integer          not null, primary key
#  name            :string
#  color           :string
#  ideology_id     :integer
#  party_leader_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Party < ApplicationRecord

  has_many :senators,
  primary_key: :id,
  foreign_key: :party_id,
  class_name: :Senator

  belongs_to :ideology,
  primary_key: :id,
  foreign_key: :ideology_id,
  class_name: :Ideology 

  belongs_to :party_leader,
  primary_key: :id,
  foreign_key: :party_leader_id,
  class_name: :Senator 
end
