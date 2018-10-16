require "capybara"

class BBCSignInPage
    SIGN_IN_PAGE = "https://account.bbc.com/signin"
    USERNAME_FIELD_ID = '#user-identifier-input'
    PASSWORD_FIELD_ID = '#password-input'
    SUBMIT_BUTTON = '#submit-button'
    USERNAME_ERROR_MESSAGE = "#form-message-username"

    PASSWORD_ERROR_MESSAGE = "#form-message-password"

    def initialize
        Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app, :browser => :chrome)
        end
        @session = Capybara::Session.new(:chrome)
    end

    def visit_sign_in_page
        @session.visit(SIGN_IN_PAGE)
    end


    def find_username
        @session.find(USERNAME_FIELD_ID)
    end

    def find_invalid_username_div
        @session.find(USERNAME_ERROR_MESSAGE)
    end

    def find_invalid_password_div
        @session.find(PASSWORD_ERROR_MESSAGE)
    end


    def fill_in_username(username)
        find_username.fill_in(with: username)
        if find_username.value == username
            return true
        end
        return false
    end



    def find_password
        @session.find(PASSWORD_FIELD_ID)
    end

    def fill_in_password(password)
        find_password.fill_in(with: password)
        if find_password.value == password
            return true
        end
        return false
    end

    def sign_in_button
        @session.find(SUBMIT_BUTTON)
    end
    def click_button_for_username
        sign_in_button.click
        return find_invalid_username_div.visible? 
    end
    def click_button_for_password
        sign_in_button.click
        return find_invalid_password_div.visible? 
    end

end

sleep 3
# call = BBCSignInPage.new

# call.visit_sign_page
# call.find_fill_username
