class Table < ApplicationRecord
  has_many :parents
  has_many :children
end
