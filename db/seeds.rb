require 'net/http'
require 'json'

url = 'https://random-tree.herokuapp.com/'
uri = URI(url)
response = Net::HTTP.get(uri)
tree = JSON.parse(response)
table = Table.new(tree: tree)
table.save!

Parent.create(parent_id: tree["id"], table_id: table.id)

def find_all_parent_ids(array=nil, table)
  array.each do |branch|
    # initial Parent with :tree_id
    p = Parent.new(parent_id: branch["id"], table_id: table.id)
    p.save!

    unless branch["child"].blank?
      branch["child"].each do |kid| 
        c = Child.new(child_id: kid["id"], parent_id: p.id, table_id: table.id)
        c.save!

        unless kid["child"].blank?
          find_all_parent_ids(kid["child"], table)
        end
      end
    end
  end
end

find_all_parent_ids(tree["child"], table)