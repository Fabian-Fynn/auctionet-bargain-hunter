require 'rails_helper'

describe "Wishlist" do
  let!(:user) { User.create(email: email, password: password)}
  let(:email) { "test@capybara.com" }
  let(:password) { "password" }

  before do
    visit root_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  it "displays a welcome message" do
    expect(page).to have_content("Signed in successfully.")
  end

  it "adds item to wishlist" do
    item_title = within(".item:first-child") { page.find("h3").text }
    click_button("Add to Wishlist", match: :first)

    expect(page).to have_content("Item successfully added to Wishlist.")
    expect(Article.where(title: item_title)).to exist
  end

  it "shows items" do
    click_link "Wishlist"

    expect(page).to have_content(Article.where(user_id: current_user.id).pluck(:title).first)
  end
end
