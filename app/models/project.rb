class Project < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :subtitle, presence: true
    validates :description, presence: true
end
