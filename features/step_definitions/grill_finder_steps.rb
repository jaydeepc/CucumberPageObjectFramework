require_relative '../../features/pages/home_page'
require_relative '../../features/pages/grill_finder_page'


Given(/^I am in the Homepage$/) do
  @home_page = HomePage.new
  @home_page.load
end

When(/^I navigate to Grill Recommendation Page$/) do
  @grill_finder_page = GrillFinderPage.new
  @grill_finder_page.load
end

When(/^Complete the Questionnaire$/) do
  @grill_finder_page.wait_for_free_standing_btn
  @grill_finder_page.free_standing_btn.click
  @grill_finder_page.wait_for_grill_size_option_1
  @grill_finder_page.grill_size_option_1.click
  @grill_finder_page.wait_for_price_range_option_1
  @grill_finder_page.price_range_option_1.click
end

Then(/^I should get a Recommendation$/) do
  @grill_finder_page.wait_for_recommendation_result
  expect(@grill_finder_page.recommendation_result.text.include? 'abcd').to be_truthy
end