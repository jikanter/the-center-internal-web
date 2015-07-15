json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :registrant_id, :conference_id, :po_id, :organization_id, :invoice_number, :date, :service_provided, :period_billed, :lineitem_id, :accounting_code, :department_id, :accounts_payable_organization_id, :terms
  json.url invoice_url(invoice, format: :json)
end
