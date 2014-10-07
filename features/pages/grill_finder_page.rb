
class GrillFinderPage < SitePrism::Page

  set_url '/Products/GrillFinder.aspx'
  element :free_standing_btn, 'a[id=Body_btnFreeStanding]'
  element :grill_size_option_1, 'input[id=Body_btnOption1]'
  element :price_range_option_1, 'input[id=Body_btnPrice1]'
  element :recommendation_result, 'h3[id=Body_hResults]'

end