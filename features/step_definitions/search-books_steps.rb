When(/^User searches for a book$/) do
  page.fill_in 'q', :with => 'Zedd'
  find(".search_button").click
end

Then(/^The book is returned in the results$/) do
  expect(page.all('tr > td.author').count).to eq(1)
end
