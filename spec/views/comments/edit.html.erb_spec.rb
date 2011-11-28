require 'spec_helper'

describe "comments/edit.html.haml" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :comment => "MyText",
      :commentable_id => 1,
      :commentable_type => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "textarea#comment_comment", :name => "comment[comment]"
      assert_select "input#comment_commentable_id", :name => "comment[commentable_id]"
      assert_select "input#comment_commentable_type", :name => "comment[commentable_type]"
    end
  end
end
