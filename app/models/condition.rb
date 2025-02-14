class Condition < ActiveRecord::Base
  belongs_to :query
  belongs_to :operator
end
