class RenamedetailTodetails < ActiveRecord::Migration[7.1]
  def change
        rename_column :tasks, :detail, :details

  end
end
