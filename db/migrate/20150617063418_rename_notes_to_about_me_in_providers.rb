class RenameNotesToAboutMeInProviders < ActiveRecord::Migration
  def change
    rename_column :providers, :notes, :about_me
  end
end
