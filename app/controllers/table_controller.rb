class TableController < ApplicationController
  def show
    first_table = Table.first.tree.to_json
    render json: ActiveSupport::JSON.decode(first_table)
  end
end
