class UserDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      id:    { source: "Blog.id" },
      title: { source: "Blog.title" },
    }
  end

  def data
    debugger(records)
    records.map do |record|
      [
        record.id,
        record.title,
      ]
    end
  end

  private

  def get_raw_records
    Blog.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
