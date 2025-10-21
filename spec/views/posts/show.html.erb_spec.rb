require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:current_user) do
    User.first_or_create!(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end
  before(:each) do
    assign(:post, Post.create!(
      title: "Title",
      body: "Body content",
      user: current_user,
      views: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body/)
  end
end
