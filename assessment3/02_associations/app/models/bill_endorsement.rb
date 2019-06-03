# == Schema Information
#
# Table name: bill_endorsements
#
#  id         :integer          not null, primary key
#  bill_id    :integer
#  senator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BillEndorsement < ApplicationRecord

  belongs_to :bill,
  primary_key: :id,
  foreign_key: :bill_id, 
  class_name: :Bill 

  belongs_to :senator,
  primary_key: :id,
  foreign_key: :senator_id,
  class_name: :Senator 

  has_many :endorsing_parties,
  through: :senator,
  source: :party 
end
