class AddFiscalYearToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :fiscal_year, :date
  end
end
