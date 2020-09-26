class Contact < ApplicationRecord
    validates :via, presence: true
    validates :value, presence: true
    belongs_to :contactable, polymorphic: true, optional: true
end
