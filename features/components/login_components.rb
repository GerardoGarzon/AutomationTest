module Login
  ELEMENTS ||= {
    login: {
      user_field: {sel: :name, loc: "email"},
      pass_field: {sel: :name, loc: "password"},
      login_button: {sel: :xpath, loc: "//*[@id='content']/div/div[2]/div/form/input"}
    },
    register: {

    }
  }
end