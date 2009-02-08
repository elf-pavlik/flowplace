require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/currency_accounts/edit.html.erb" do
  include CurrencyAccountsHelper
  
  before(:each) do
    assigns[:currency_account] = @currency_account = stub_model(CurrencyAccount,
      :new_record? => false,
      :user_id => 1,
      :currency_id => 1,
      :summary => "value for summary"
    )
  end

  it "should render edit form" do
    render "/currency_accounts/edit.html.erb"
    
    response.should have_tag("form[action=#{currency_account_path(@currency_account)}][method=post]") do
      with_tag('input#currency_account_user_id[name=?]', "currency_account[user_id]")
      with_tag('input#currency_account_currency_id[name=?]', "currency_account[currency_id]")
      with_tag('textarea#currency_account_summary[name=?]', "currency_account[summary]")
    end
  end
end


