require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  # -------------------------------------------------------------
  # Setup: Create or reuse a test user to associate with posts
  # -------------------------------------------------------------
  let(:current_user) do
    User.first_or_create!(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  # -------------------------------------------------------------
  # Test Data: Create two sample posts for rendering
  # -------------------------------------------------------------
  let!(:posts) do
    [
      Post.create!(
        title: "Hello World",
        body: "Body Content",
        user: current_user,
        views: 2
      ),
      Post.create!(
        title: "Another Post",
        body: "This is a custom text",
        user: current_user,
        views: 2
      )
    ]
  end

  # -------------------------------------------------------------
  # Assign: Pass the posts to the view before rendering
  # -------------------------------------------------------------
  before { assign(:posts, posts) }

  # -------------------------------------------------------------
  # Test: Ensure each post's title and body appear in the rendered view
  # -------------------------------------------------------------
  it "renders a list of posts" do
    render

    # Check that each post's title and body are present in the HTML
    posts.each do |post|
      expect(rendered).to include(post.title)
      expect(rendered).to include(post.body)
    end

    # # Alternative (structural) check using assert_select:
    # assert_select 'div > p', text: /Hello World/, count: 1
    # assert_select 'div > p', text: /Body Content/, count: 1
    # # div[id^=post_] selects only the post containers (post_1, post_2)
    # assert_select 'div[id^=post_] > p', text: /Title:/, count: 2
    # assert_select 'div[id^=post_] > p', text: /Body:/, count: 2
    
    # # or with regex (case-insensitive):
    # expect(rendered).to match(/hello world/i)
    # expect(rendered).to match(/This is a custom text/i)

    # Debug: Uncomment to print the rendered HTML in the test output
    # puts rendered
  end
end
