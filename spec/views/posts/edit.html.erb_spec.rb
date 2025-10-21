require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:current_user) do
    User.first_or_create!(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:post) do
    Post.create!(
      title: "MyString",
      body: "MyString",
      user: current_user,
      views: 1
    )
  end

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[body]"
    end

    # Debug: print the rendered HTML to the console
    # puts rendered
  end
end
