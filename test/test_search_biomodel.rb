require 'test/unit'
require 'search_biomodel'


class TestSearchBiomodel < Test::Unit::TestCase
  include SysMODB::SearchBiomodel

  def test_find_all_models
    response =  get_all_models
    assert_not_nil response
  end
end
