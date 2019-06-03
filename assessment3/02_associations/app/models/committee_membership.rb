# == Schema Information
#
# Table name: committee_memberships
#
#  id           :integer          not null, primary key
#  senator_id   :integer
#  committee_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CommitteeMembership < ApplicationRecord

  belongs_to :senator,
  primary_key: :id,
  foreign_key: :senator_id,
  class_name: :Senator

  belongs_to :committee,
  primary_key: :id,
  foreign_key: :committee_id,
  class_name: :Committee
end
