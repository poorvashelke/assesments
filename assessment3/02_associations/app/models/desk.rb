# == Schema Information
#
# Table name: desks
#
#  id         :integer          not null, primary key
#  model      :string
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Desk < ApplicationRecord

  belongs_to :owner,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :Senator 
end
