
describe "Incorrect user details produces valid error" do
    context " it should respond with the correct error when incorerect details are input" do
        
        before(:all) do

            @bbc_page = BBCSite.new.bbc_homepage
            @bbc_page.visit_homepage
            @bbc_sign_in_page = BBCSite.new.bbc_sign_in_page
            @bbc_sign_in_page.visit_sign_in_page

        end

        it "should produce an error when inputing an incorrect username " do
            expect(@bbc_sign_in_page.fill_in_username('manav993@gmail.com')).to eql(true) 
        end
        it "should produce an error when inputing an incorrect password " do
            expect(@bbc_sign_in_page.fill_in_password('Manavendu')).to eql(true) 
        end
        it "should check if clicked on password" do
            expect(@bbc_sign_in_page.click_button_for_username).to eq(true)
        end
        it "should check if clicked on password" do
            expect(@bbc_sign_in_page.click_button_for_password).to eq(true)
        end
    end

end
