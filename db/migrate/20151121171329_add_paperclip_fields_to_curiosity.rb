class AddPaperclipFieldsToCuriosity < ActiveRecord::Migration
  def change
    add_column :curiosities, :image_file_name,    :string
    add_column :curiosities, :image_content_type, :string
    add_column :curiosities, :image_file_size,    :integer
    add_column :curiosities, :image_updated_at,   :datetime
  end
end
