require 'rubygems'
#require '/home/cspc018/Work/Repos/gems/search_biomodel/lib/search_biomodel.rb'
require 'seach_biomodel'


  include SysMODB::SearchBiomodel

  puts "\n\n ------------------ List All -----------------------------\n\n"
  all_models = get_all_models
  all_models.each { |item| puts "ID = #{item[:key]}    |    NAME = #{item[:value]}\n" }


  puts "\n\n ------------------ By Chebiid --------------------------\n\n"
  i=0
  models_by_chebiid = search_by_ChEBIID("CHEBI:15422")
  models_by_chebiid.each { |item| puts "#{i+=1} #{item.to_s}\n"}


  puts "\n\n ------------------ By Name -----------------------------\n\n"
  i=0
  models_by_name = search_by_name("Kolomeisky2003")
  models_by_name.each { |item| puts "#{i+=1} #{item.to_s}\n"}

  puts "\n ----------------------------------------------------------\n\n\n"
