require 'test/unit'
require 'search_biomodel'


class TestSearchBiomodel < Test::Unit::TestCase
  include SysMODB::SearchBiomodel


#returned result is a hash. use response[:key] or response[:value]
   def test_find_all_models
      response = []
      i=0
      response = get_all_models
      response.each {|x| puts "\n\n Response #{i+=1}:   #{x[:value].to_s} "}
      response.each {|x| assert_not_nil x[:value] }
   end


# need to find example of chebiid
   def test_search_by_ChEBIID
      response = []
      i = 0 
      response = search_by_ChEBIID("CHEBI:15422")
      response.each {|x| puts "\n\n Response #{i+=1}:   #{x} "}
      response.each {|x| assert_not_nil x }
   end


#need to handle multiple results
   def test_search_by_name
      response = []
      i = 0 
      response = search_by_name("Kolomeisky2003")    #_MyosinV_Processivity")
      response.each {|x| puts "\n\n Response #{i+=1}:   #{x} "}
      response.each {|x| assert_not_nil x }
   end
end