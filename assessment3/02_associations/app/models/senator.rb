# == Schema Information
#
# Table name: senators
#
#  id         :integer          not null, primary key
#  fname      :string
#  lname      :string
#  state      :string
#  party_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Senator < ApplicationRecord

  has_many :bills, 
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Bill

  belongs_to :party,
  primary_key: :id,
  foreign_key: :party_id,
  class_name: :Party

  has_one :party_led,
  primary_key: :id,
  foreign_key: :party_leader_id,
  class_name: :Party 

  has_one :party_leader,
  through: :party,
  source: :party_leader 

  has_many :bill_endorsements,
  primary_key: :id,
  foreign_key: :senator_id,
  class_name: :BillEndorsement 

  has_many :committee_memberships,
  primary_key: :id,
  foreign_key: :senator_id,
  class_name: :CommitteeMembership  

  has_many :committees,
  through: :committee_memberships,
  source: :committee 

  has_many :chairpersons,
  primary_key: :id,
  foreign_key: :chairperson_id,
  class_name: :Committee 


  has_many :chairpersons,
  through: :committees,
  source: :chairperson 

  has_one :desk,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :Desk 

  has_one :ideology,
  through: :party,
  source: :ideology


  has_one :committee_chaired,
  through: :committees,
  source: :committee


end
