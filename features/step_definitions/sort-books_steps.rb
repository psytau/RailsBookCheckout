And(/^2 books exist in the system$/) do
  @book1 = Book.create!(author: "A guy", title: "A book", approved_at: Time.now)
  @book2 = Book.create!(author: "Zedd", title: "Another book", approved_at: Time.now)
end

When(/^User clicks the title sort button$/) do
  find('.title_link').click
end

Then(/^The page is sorted ascending/) do
  expect(page.all('tr > td.author').first[:id]).to eq(@book2.id.to_s)
end

Then(/^The page is sorted descending/) do
  expect(page.all('tr > td.author').first[:id]).to eq(@book1.id.to_s)
end
