require 'rails_helper'

RSpec.describe "comming_soon/splash.html.haml", :type => :view do
  it "should print out a splash screen" do
    render
    assert_select 'h1'
  end
end
