class UserPage
  def initialize
    @credentials = UserData::CREDENTIALS
    @elements = Login::ELEMENTS
  end

  def login(user)
    navbar = NavbarPage.new
    navbar.click_button("user_dropdown", "initial")
    navbar.click_button("login_user", "initial")
    SeleniumPage.send_keys(@credentials[user.to_sym][:user], @elements[:login][:user_field])
    SeleniumPage.send_keys(@credentials[user.to_sym][:pass], @elements[:login][:pass_field])
    SeleniumPage.click_element(@elements[:login][:login_button])
  end

end