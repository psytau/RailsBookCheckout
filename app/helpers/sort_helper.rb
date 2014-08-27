module SortHelper
  def search_sort_by
    if params[:column]
      order = 'asc'

      # order
      binding.pry
      if params[:order] == 'asc'
        order = 'desc'
      end
      {column: params[:column], order: order}
    end
  end
end