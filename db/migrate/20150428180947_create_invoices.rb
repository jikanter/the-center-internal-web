class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :registrant_id
      t.integer :conference_id
      t.integer :po_id
      t.integer :organization_id
      t.integer :invoice_number
      t.datetime :date
      t.text :service_provided
      t.integer :lineitem_id
      t.integer :accounting_code
      t.integer :department_id
      t.integer :accounts_payable_organization_id
      t.integer :terms

      t.timestamps null: false
    end
  end
end
