require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { accounting_code: @invoice.accounting_code, accounts_payable_organization_id: @invoice.accounts_payable_organization_id, conference_id: @invoice.conference_id, date: @invoice.date, department_id: @invoice.department_id, invoice_number: @invoice.invoice_number, lineitem_id: @invoice.lineitem_id, organization_id: @invoice.organization_id, period_billed: @invoice.period_billed, po_id: @invoice.po_id, registrant_id: @invoice.registrant_id, service_provided: @invoice.service_provided, terms: @invoice.terms }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, id: @invoice, invoice: { accounting_code: @invoice.accounting_code, accounts_payable_organization_id: @invoice.accounts_payable_organization_id, conference_id: @invoice.conference_id, date: @invoice.date, department_id: @invoice.department_id, invoice_number: @invoice.invoice_number, lineitem_id: @invoice.lineitem_id, organization_id: @invoice.organization_id, period_billed: @invoice.period_billed, po_id: @invoice.po_id, registrant_id: @invoice.registrant_id, service_provided: @invoice.service_provided, terms: @invoice.terms }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
