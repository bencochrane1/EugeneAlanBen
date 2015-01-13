class Project < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :client, presence: true

    include RankedModel 
    ranks :row_order
end
