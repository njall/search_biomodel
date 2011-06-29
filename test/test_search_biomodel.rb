require 'test/unit'
require '/home/cspc018/Work/Repos/gems/search_biomodel/lib/search_biomodel.rb'


class TestSearchBiomodel < Test::Unit::TestCase

  include SysMODB::SearchBiomodel

   def test_find_all_models
      puts "\n\n ---------------------find all models---------------------\n\n"
      response = []
      i=0
      response = get_all_models
      response.each {|x| puts "Response #{i+=1}:   #{x[:key].to_s} "}
      response.each {|x| assert_not_nil x[:key] }
      assert_not_nil response
   end


   def test_search_by_ChEBIID
      puts "\n\n ---------------------search by chebiid---------------------\n\n"
      response = []
      i = 0 
      response = search_by_ChEBIID("CHEBI:15422")
      response.each {|x| puts "Response #{i+=1}:   #{x} "}
      response.each {|x| assert_not_nil x }
      assert_not_nil response
   end

   def test_search_by_name
      puts "\n\n ---------------------model ID by name---------------------\n\n"
      response = []
      i = 0 
      response = search_by_name("Kolomeisky2003")    #_MyosinV_Processivity")
      response.each {|x| puts "Response #{i+=1}:   #{x} "}
      response.each {|x| assert_not_nil x }
      assert_not_nil response
   end
 

  def test_get_model_name_by_id
      puts "\n\n ---------------------model name by ID---------------------\n\n"
      response = get_model_name_by_id("BIOMD0000000190")
      puts response
      assert_not_nil response
  end



   def test_get_models_id_by_person
      puts "\n\n ---------------------model ID by person---------------------\n\n"
      response = []
      i=0
      response = get_models_id_by_person("Jim")
      response.each {|x| puts "Response #{i+=1}:    #{x} "} 
      response.each {|x| assert_not_nil x }
      assert_not_nil response
  end

end
