# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string
#  mandate        :string
#  chairperson_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Committee < ApplicationRecord

  has_many :memberships,
  primary_key: :id,
  foreign_key: :committee_id,
  class_name: :CommitteeMembership 

  belongs_to :chairperson,
  primary_key: :id,
  foreign_key: :chairperson_id,
  class_name: :Senator 

  has_many :senators,
  through: :memberships,
  source: :senator 


end
