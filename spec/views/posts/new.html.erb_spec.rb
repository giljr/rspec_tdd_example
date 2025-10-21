require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  # -------------------------------------------------------------
  # Setup: Create or reuse a test user
  # -------------------------------------------------------------
  let(:current_user) do
    User.first_or_create!(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  # -------------------------------------------------------------
  # Assign a new post to the view before rendering
  # -------------------------------------------------------------
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      body: "MyString",
      user: current_user,
      views: 1
    ))
  end

  # -------------------------------------------------------------
  # Test: Ensure the new post form is rendered correctly
  # -------------------------------------------------------------
  it "renders new post form" do
    render

    # Check the form itself
    assert_select "form[action=?][method=?]", posts_path, "post" do

      # Title field (input)
      assert_select "input[name=?]", "post[title]"

      # Body field (textarea)
      assert_select "textarea[name=?]", "post[body]"

      # Debug: Uncomment to see rendered HTML
      # puts rendered
    end
  end
end
