require 'spec_helper'

describe "ideas/show.html.erb" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :user_id => 1,
      :subject => "Subject",
      :body => "MyText",
      :votes => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
