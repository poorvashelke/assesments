# == Schema Information
#
# Table name: bills
#
#  id         :integer          not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bill < ApplicationRecord

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Senator

  has_many :bill_endorsements,
  primary_key: :id,
  foreign_key: :bill_id,
  class_name: :BillEndorsement 

  has_one :sponsoring_party,
  through: :author,
  source: :party 

  has_many :endorsing_senators,
  through: :bill_endorsements,
  source: :senator 



end
