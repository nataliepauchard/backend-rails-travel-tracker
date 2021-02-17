class Country < ApplicationRecord
    has_many :visits
    has_many :users, :through => :visits
end
