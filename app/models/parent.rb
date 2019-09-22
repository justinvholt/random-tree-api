class Parent < ApplicationRecord
  has_many :children
  belongs_to :table

  # iterate through parent to find children ids
  def find_parent_ids(array=nil)
    parent_id = []

    puts array.class
    parent = Parent.find_by(array)
    puts parent

    parent_id << parent.children.pluck(:child_id)

    parent.children.each do |child| 
      unless child.children.blank?
        parent_id << child.child_id
      end
    end

    # parent.each do |p|
    #   unless p.child.blank?
    #     parent_id << child.child_id
    #     child_id = p.child.pluck(:child_id)

    #     unless child_id.blank?
    #       find_parent_ids(child_id)
    #     end
    #   end
    # end

    parent_id
  end
end