Given /an* "([^\"]*)" currency "([^\"]*)"/ do |currency_type,currency_name|
  klass = "Currency#{currency_type}".constantize
  creator = @user.id if @user
  creator ||= 1
  @currency = klass.create!({:type => currency_type, :name => currency_name, :steward_id => creator})
end

Given /^I am an* "([^\"]*)" of currency "([^\"]*)"/ do |player_class,currency_name|
  c = Currency.find_by_name(currency_name)
  @currency_account = CurrencyAccount.create!({:user => @user,:name => "#{@user.full_name}'s #{c.name} #{player_class} account", :currency => c, :player_class => player_class})
  if c.respond_to?(:xgfl)
    @currency_account.setup
    @currency_account.save
  end
end

Given /^"([^\"]*)" is an* "([^\"]*)" of currency "([^\"]*)"/ do |user,player_class,currency_name|
  @user = User.find_by_user_name(user)
  create_user(user) if @user.nil?
  c = Currency.find_by_name(currency_name)
  @currency_account = CurrencyAccount.create!({:user => @user,:name => "#{@user.full_name}'s #{c.name} #{player_class} account", :currency => c, :player_class => player_class})
  if c.respond_to?(:xgfl)
    @currency_account.setup
    @currency_account.save
  end
end

When /^I follow "([^\"]*)" for currency account "([^\"]*)"$/ do |link,currency_account_name|
  c = CurrencyAccount.find_by_name(currency_account_name)
  within('tr#currency_account_'+c.name_as_html_id) do |scope|
    click_link(link)
  end
end

Then /^I should( not)* see a currency account "([^\"]*)"$/ do |should_not,currency_account_name|
  a = CurrencyAccount.find_by_name(currency_account_name)
  if should_not
    a.should == nil
  else
    lambda {within('tr#currency_account_'+a.name_as_html_id) {}}.should_not raise_error
  end
end