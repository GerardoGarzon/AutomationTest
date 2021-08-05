navbar = NavbarPage.new

And(/^I search the item "([^"]*)"$/) do |value|
  navbar.search_item(value)
end

When(/^I click on "([^"]*)" button on "([^"]*)" page$/) do |button, page|
  navbar.click_button(button, page)
end

Then(/^I should see the "([^"]*)" page$/) do |page|
  navbar.verify_page(page)
  navbar.verify_title(page)
end

And(/^I get the best result$/) do
  navbar.find_best_result
end

Then(/^I should see "([^"]*)" alert$/) do |alert|
  navbar.verify_element(alert, "alert")
end

Then(/^I verify the look and feel of "([^"]*)"$/) do |page|
  navbar.verify_look_feel(page)
end

And(/^I verify the cart data$/) do
  navbar.compare_prices
end