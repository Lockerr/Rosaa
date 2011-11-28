require 'spec_helper'

describe "ideas/edit.html.haml" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :user_id => 1,
      :subject => "MyString",
      :body => "MyText",
      :votes => 1
    ))
  end

  it "renders the edit idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ideas_path(@idea), :method => "post" do
      assert_select "input#idea_user_id", :name => "idea[user_id]"
      assert_select "input#idea_subject", :name => "idea[subject]"
      assert_select "textarea#idea_body", :name => "idea[body]"
      assert_select "input#idea_votes", :name => "idea[votes]"
    end
  end
end
