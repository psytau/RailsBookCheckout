require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :author => "Author",
        :title => "Title",
        :status => "Status",
        :isbn => "Isbn",
        :active => true
      ),
      Book.create!(
        :author => "Author",
        :title => "Title",
        :status => "Status",
        :isbn => "Isbn",
        :active => true
      )
    ])

    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  it "renders a list of books for a non-admin user" do
    # @ability.can :admin, :site
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    # I need to make this select less greedy, it picks up all the activate strings.
    # assert_select "a", :test => "Activate", :count => 0
    assert_select "a", :text => "Deactivate", :count => 0
  end
end
