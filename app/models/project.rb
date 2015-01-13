class Project < ActiveRecord::Base
    belongs_to :account
    has_many :lessons

    validates :name, presence: true, uniqueness: true
    validates :subtitle, presence: true
    validates :description, presence: true
end
