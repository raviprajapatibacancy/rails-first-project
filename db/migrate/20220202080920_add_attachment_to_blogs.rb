class AddAttachmentToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :attachment, :string
  end
end
