require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

let(:comment) { FactoryGirl.create :comment }
let(:user) { FactoryGirl.create :user }

  it "requires user logged in to create or delete comments" do
  describe "#create" do
    #Not logged in
    context "with no signed in user" do
      it "redirects to root path" do
        post :create, params: { amount: 10, comment_id: comment.id}
        expect(response).to redirect_to root_path
      end
    end

    context "with signed in user" do
      before { request.session[:user_id] = user.id }

      context "with valid attributes" do
        def valid_request
          post :create, params: {comment: {body: "comment body"}}
        end

        it "creates a comment in the database" do
          count_before = Comment.count
          valid_request
          count_after = Comment.count
          expect(count_after).to eq(count_before + 1)
        end

        it "redirect to the idea show page" do
          valid_request
          expect(response).to redirect_to(idea_path)
        end

        it "associates the created comment with the logged in user" do
          valid_request
          expect(Comment.last.user).to eq(user)
        end
    end

      context "with invalid attributes" do
        def invalid_request
          post :create, params: {comment: {body: nil}}
        end
        it "doesn't create comment in the database" do
          count_before = Comment.count
          invalid_request
          count_after = Comment.count
          expect(count_before). to eq(count_after)
        end
        it "renders the idea show template" do
          invalid_request
          expect(response).to render_template("ideas/show")
        end
      end
  end

  describe "#destroy" do
    context "with no signed in user" do
      it "redirects to root path" do
        delete :destroy, params: {id: comment.id}
        expect(response).to redirect_to root_path
      end
    end

    context "with signed in user" do
      before { request.session[:user_id] = user.id }

      it "removes the comment record from the database" do
        comment # this calls the method defiend by the `let` to create the record
        count_before = Comment.count
        delete :destroy, params: { id: comment.id}
        count_after = Comment.count
        expect(count_after).to eq(count_before - 1)
      end
    end
  end

  end










  describe "redirects back to the idea show page after creating or deleting comments" do
  # create a coment "with valid parameters"
      def valid_request
        post :create, params: {comment: {body: "comment body"}}
      end

      it "saves a record to the database" do
        count_before = Comment.count
        valid_request
        count_after = Comment.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the idea show page" do
        valid_request
        expect(response).to redirect_to(ideas_path)
      end

  # destroy a comment
      it "removes the record from the database" do
        #GIVEN: we have a comment record in the database
        c = FactoryGirl.create(:comment)
        count_before = Comment.count
        #WHEN: we sent a delete request to the destroy action
        delete :destroy, params: {id: c.id}
        #THEN: the comment record gets removed
        count_after = Comment.count
        expect(count_after).to eq(count_before - 1)
      end

      it "redirects to the idea show page" do
        c = FactoryGirl.create :comment
        delete :destroy, params: { id: c.id }
        expect(response).to redirect_to ideas_path
      end
  end

   it "associates comments with logged in users" do
    valid_request
    expect(Comment.last.user).to eq(user)
   end

  # it "allows users to delete only their own comments"

  # it "allows idea owners to delete any comments on their ideas"

end
