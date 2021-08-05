module NavBar
  ELEMENTS ||= {
    search: {sel: :name, loc: "search"},
    best_result: {sel: :xpath, loc: "//*[@id='content']/div[3]/div[1]"},
    price: {sel: :xpath, loc: "//*[@id='content']/div[3]/div/div/div[2]/div[1]/p[2]/span"},

    initial: {
      search_button: {sel: :xpath, loc: "//*[@id='search']/span/button"},
      user_dropdown: {sel: :xpath, loc: "//*[@id='top-links']/ul/li[2]"},
      login_user: {sel: :xpath, loc: "//*[@id='top-links']/ul/li[2]/ul/li[2]/a"},
      cart: {sel: :id, loc: "cart"}
    },

    search_result: {
      title: {sel: :xpath, loc: "//*[@id='content']/h1"},
      add_wishlist: {sel: :xpath, loc: "//*[@id='content']/div[3]/div[1]/div/div[2]/div[2]/button[2]"},
      add_cart: {sel: :xpath, loc: "//*[@id='content']/div[3]/div[1]/div/div[2]/div[2]/button[1]"},
    },

    alert: {
      wishlist: {sel: :xpath, loc: "//*[@id='product-search']/div[1]"},
      cart: {sel: :xpath, loc: "//*[@id='product-search']/div[1]"},
    },

    cart: {
      img: {sel: :xpath, loc: "//*[@id='cart']/ul/li[1]/table/tbody/tr/td[1]/a/img"},
      name: {sel: :xpath, loc: "//*[@id='cart']/ul/li[1]/table/tbody/tr/td[2]/a"},
      amount: {sel: :xpath, loc: "//*[@id='cart']/ul/li[1]/table/tbody/tr/td[3]"},
      price: {sel: :xpath, loc: "//*[@id='cart']/ul/li[1]/table/tbody/tr/td[4]"},
      delete: {sel: :xpath, loc: "//*[@id='cart']/ul/li[1]/table/tbody/tr/td[5]/button"},


      subtotal_lbl: {sel: :xpath, loc: "//*[@id='cart']/ul/li[2]/div/table/tbody/tr[1]/td[1]"},
      subtotal_amount: {sel: :xpath, loc: "//*[@id='cart']/ul/li[2]/div/table/tbody/tr[1]/td[2]"},

      total_lbl: {sel: :xpath, loc: "//*[@id='cart']/ul/li[2]/div/table/tbody/tr[2]/td[1]"},
      total_amount: {sel: :xpath, loc: "//*[@id='cart']/ul/li[2]/div/table/tbody/tr[2]/td[2]"},

      view_cart: {sel: :xpath, loc: "//*[@id='cart']/ul/li[2]/div/p/a[1]"},
      checkout: {sel: :xpath, loc: "//*[@id='cart']/ul/li[2]/div/p/a[2]"},

    }
  }
end