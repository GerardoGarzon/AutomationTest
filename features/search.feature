Feature: Your store search automation test features

  Scenario: Search a specific device
    Given I open the site using selenium
    And I login using "qa_test" credentials
    And I search the item "Palm Treo Pro"
    When I click on "search_button" button on "initial" page
    Then I should see the "search_result" page
    And I get the best result
    When I click on "add_wishlist" button on "search_result" page
    Then I should see "wishlist" alert
    When I click on "add_cart" button on "search_result" page
    Then I should see "cart" alert
    When I click on "cart" button on "initial" page
    Then I verify the look and feel of "cart"
    And I verify the cart data
    And I click on "delete" button on "cart" page