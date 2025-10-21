require 'rails_helper'

RSpec.describe "/posts", type: :request do
  include Warden::Test::Helpers
  Warden.test_mode!

  let(:current_user) do
    User.first_or_create!(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  # Sign in the user before each request
  before { login_as(current_user, scope: :user) }
  after { Warden.test_reset! }

  let(:valid_attributes) do
    {
      title: "Sample Post",
      body: "This is a sample post content.",
      views: 1
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      body: ""
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Post.create!(valid_attributes.merge(user: current_user))
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post = Post.create!(valid_attributes.merge(user: current_user))
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      post = Post.create!(valid_attributes.merge(user: current_user))
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.not_to change(Post, :count)
      end

      it "renders a response with 422 status" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "PATCH /update" do
    let(:post) { Post.create!(valid_attributes.merge(user: current_user)) }

    context "with valid parameters" do
      let(:new_attributes) { { title: "Updated Post", body: "Updated body content" } }

      it "updates the requested post" do
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(post.title).to eq("Updated Post")
        expect(post.body).to eq("Updated body content")
      end

      it "redirects to the post" do
        patch post_url(post), params: { post: new_attributes }
        expect(response).to redirect_to(post_url(post))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create!(valid_attributes.merge(user: current_user))
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create!(valid_attributes.merge(user: current_user))
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
