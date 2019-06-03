# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
    has_many :memberships,
    foreign_key: :board_id,
    class_name: 'BoardMembership'

    has_many :members,
    through: :memberships,
    source: :member

    belongs_to :company,
    foreign_key: :company_id,
    class_name: 'Company'

    has_one :exchange,
    through: :company,
    source: :exchange


end
