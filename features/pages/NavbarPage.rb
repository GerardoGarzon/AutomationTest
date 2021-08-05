require 'colorize'

class NavbarPage
  class << self
    attr_accessor :actual_search, :best_result, :price
    @actual_search = nil
    @best_result = nil
    @price = nil
  end

  def initialize
    @elements = NavBar::ELEMENTS
  end

  def search_item(value)
    element = @elements[:search]
    NavbarPage.actual_search = value
    SeleniumPage.send_keys(value, element)
  end

  def click_button(button, page)
    element = @elements[page.to_sym][button.to_sym]
    SeleniumPage.click_element(element)
    sleep 3
  end

  def verify_page(page)
    result = SeleniumPage.element_visible(@elements[page.to_sym][:title])
    unless result
      fail("The page is not the expected".upcase)
    end
  end

  def verify_title(page)
    expected_title = "Search - #{NavbarPage.actual_search}"
    SeleniumPage.compare_text(expected_title, @elements[page.to_sym][:title])
  end

  def find_best_result
    if SeleniumPage.element_visible(@elements[:best_result])
      NavbarPage.price = SeleniumPage.get_text(@elements[:price]).gsub("Ex Tax: ", "")
    else
      fail("The search has not results".upcase)
    end
  end

  def verify_element(element, page)
    unless SeleniumPage.element_visible(@elements[page.to_sym][element.to_sym])
      fail("Alert #{element} not found".upcase)
    end
  end

  def verify_look_feel(page)
    SeleniumPage.verify_hash_elements(@elements[page.to_sym])
  end

  def compare_prices
    SeleniumPage.compare_text(NavbarPage.price, @elements[:cart][:price])
    SeleniumPage.compare_text(NavbarPage.price, @elements[:cart][:subtotal_amount])
    SeleniumPage.compare_text(NavbarPage.price, @elements[:cart][:total_amount])
  end
end