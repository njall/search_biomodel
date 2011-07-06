require 'test/unit'
require 'helper'
class TestSearchBiomodel < Test::Unit::TestCase

  def setup
    @instance = SysMODB::SearchBiomodel.instance
  end

  def test_find_all_models
    puts "\n\n ---------------------find all models---------------------\n\n"
    response = []
    i=0
    response = @instance.get_all_models
    response.each { |x| puts "Response #{i+=1}:   #{x[:key].to_s} " }
    response.each { |x| assert_not_nil x[:key] }
    assert_not_nil response
  end


  def test_search_by_ChEBIID
    puts "\n\n ---------------------search by chebiid---------------------\n\n"
    response = []
    i = 0
    response = @instance.search_by_ChEBIID("CHEBI:15422")
    response.each { |x| puts "Response #{i+=1}:   #{x} " }
    response.each { |x| assert_not_nil x }
    assert_not_nil response
  end

  def test_search_by_incorrect_ChEBIID
    puts "\n\n ---------------------search by incorrect chebiid---------------------\n\n"
    response = []
    i = 0
    response = @instance.search_by_ChEBIID("THIS IS NOT A VALID CHEBIID!!!!!<P></P>")
    response.each { |x| puts "Response #{i+=1}:   #{x} " }
    response.each { |x| assert_not_nil x }
    assert_not_nil response
  end


  def test_search_by_name
    puts "\n\n ---------------------model ID by name---------------------\n\n"
    response = []
    i = 0
    response = @instance.search_by_name("Kolomeisky2003") #_MyosinV_Processivity")
    response.each { |x| puts "Response #{i+=1}:   #{x} " }
    response.each { |x| assert_not_nil x }
    assert_not_nil response
  end

  def test_search_by_incorrect_name
    puts "\n\n ---------------------model ID by incorrect name---------------------\n\n"
    response = []
    i = 0
    response = @instance.search_by_name("THIS IS NOT A VALID NAME!!!!!<P></P>") #_MyosinV_Processivity")
    response.each { |x| puts "Response #{i+=1}:   #{x} " }
    response.each { |x| assert_not_nil x }
    assert_not_nil response
  end


  def test_get_model_name_by_id
    puts "\n\n ---------------------model name by ID---------------------\n\n"
    response = @instance.get_model_name_by_id("BIOMD0000000190")
    puts response
    assert_not_nil response
  end
    def test_get_model_name_by_incorrect_id
    puts "\n\n ---------------------model name by incorrect ID---------------------\n\n"
    response = @instance.get_model_name_by_id("THIS IS NOT A VALID ID!!!!!<P></P>")
    puts response
    assert_not_nil response
  end


  def test_search_id_by_person
    puts "\n\n ---------------------model ID by person---------------------\n\n"
    response = []
    i=0
    response = @instance.search_by_person("Jim")
    response.each { |x| puts "Response #{i+=1}:    #{x} " }
    response.each { |x| assert_not_nil x }
    assert_not_nil response
  end

    def test_search_by_incorrect_person
    puts "\n\n ---------------------model ID by incorrect person---------------------\n\n"
    response = []
    i=0
    response = @instance.search_by_person("THIS IS NOT A VALID PERSONS NAME!!!!!<P></P>")
    response.each { |x| puts "Response #{i+=1}:    #{x} " }
    response.each { |x| assert_not_nil x }
    assert_not_nil response
  end

end
