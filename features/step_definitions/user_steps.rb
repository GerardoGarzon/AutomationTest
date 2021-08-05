user_page = UserPage.new

And(/^I login using "([^"]*)" credentials$/) do |credentials|
  user_page.login(credentials)
end