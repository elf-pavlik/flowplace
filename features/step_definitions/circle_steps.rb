Given /^a circle "([^\"]*)"$/ do |circle_name|
  @user ||= create_user('anonymous')
  CurrencyMembrane.create(@user,{:circle=>{:steward_id=>@user.id, :name => circle_name},:password=>'password',:confirmation=>'password',:email => 'test@test.com'})
end

When /^I check the box for user "([^\"]*)"$/ do |user_name|
  user = User.find_by_user_name(user_name)
  When %Q|I check "users_#{user.id}"|
end

When /^I check the box for player "([^\"]*)" as "([^\"]*)"$/ do |user_name,player_class|
  ca = CurrencyAccount.find(:first,:conditions => ['player_class = ? and name = ?',player_class,user_name])
  When %Q|I check "players_#{ca.id}"|
end

When /^I check the box for currency "([^\"]*)"$/ do |currency_name|
  currency = Currency.find_by_name(currency_name)
  When %Q|I check "currencies_#{currency.id}"|
end

When /^I check the box for bound currency "([^\"]*)"$/ do |currency_name|
  currency = Currency.find_by_name(currency_name)
  When %Q|I check "bound_currencies_#{currency.id}"|
end

Given /^a circle "([^\"]*)" with members "([^\"]*)"$/ do |circle_name,member_list|
  Given %Q|a circle "#{circle_name}"| if Currency.find_by_name(circle_name).nil?
  Given %Q|I make "#{member_list}" a "member" of "#{circle_name}"|
end

Given /^I make "([^\"]*)" a "([^\"]*)" of "([^\"]*)"$/ do |users, role, circle_name|
  members = users.split(/, */)
  save_user = @user
  members.each {|m| create_user(m) if User.find_by_user_name(m).nil?}
  @user = save_user
  When %Q|I go to the players page for "#{circle_name}"|
  Then %Q|I should be taken to the players page for "#{circle_name}"|
  members.each do |m|
    When %Q|I check the box for user "#{m}"|
  end
  When %Q|I select "#{role}" from "player_class"|
  When %Q|I press "Add >>"|
end

Given /^I bind "([^\"]*)" to "([^\"]*)"( with autojoin on)*$/ do |currency_name, circle_name,autojoin|
  circle = Currency.find_by_name(circle_name)
  When %Q|I go to the "bind_currency" play page for my "namer" account in "#{circle_name}"|
  And %Q|I select "#{currency_name}" from "play_currency"|
  And %Q|I select "#{circle.circle_user_name}" from "play_to"|
  And %Q|I fill in "play_name" with "#{currency_name}"|
  And %Q|I fill in "play_autojoin" with "1"| if autojoin
  And %Q|I press "Record Play"|
  Then %Q|I should see "The play was recorded."|
end

And /^I grant "([^\"]*)" role "([^\"]*)" in "([^\"]*)" for "([^\"]*)"$/ do |user_name, player_class, currency_name,circle_name|
  And %Q|I go to the "grant" play page for my "namer" account in "#{circle_name}"|
  And %Q|I select "#{user_name}" from "play_to"|
  And %Q|I select "#{currency_name}" from "play_currency"|
  And %Q|I fill in "play_player_class" with "#{player_class}"|
  And %Q|I press "Record Play"|
end