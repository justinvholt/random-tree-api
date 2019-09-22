class ParentController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    first_table = Table.first.tree.to_json
    render json: ActiveSupport::JSON.decode(first_table)

    # parents = Parent.pluck(:parent_id, :id)
    # children = Parent.all.map { |c| c.children }
    # render json: { parents: parents, children: children }
    # url = 'https://random-tree.herokuapp.com/'
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    # tree = JSON.parse(response)
    # render json: tree
  end

  def show
    parent = Parent.find_by(parent_id: params[:id])
    id_arr = parent.find_parent_ids(params[:id])
    render json: id_arr
  end

  def parent_list

  end

  def children_list

  end
end
