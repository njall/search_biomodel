require 'rubygems'
require 'savon'

module SysMODB

  class SearchBiomodelException < Exception
    puts "Awww maaaan. Didn't work"
  end

  module SearchBiomodel
   
    def search_by_ChEBIID
      client = create_connection
      response = client.request(:biom, "get_models_id_by_ch_ebi_id") do
        soap.body = { :ChEBBId => value, :attributes! => { :ChEBBId => { "xsi:type" => "xsd:string" } } }  
      end
      return response.to_hash[:get_models_id_by_ch_ebi_id_response][:get_models_id_by_ch_ebi_id_return][:get_models_id_by_ch_ebi_id_return]
    end
    
    def get_all_models
      client = create_connection  
      response = client.request :biom, "get_all_models" 
      parse_responses response, "get_all_models"
      return response.to_hash[:get_all_models_response][:get_all_models_return][:get_all_models_return]
    end
  
    def get_models_id_by_name
      client = create_connection
      response = client.request(:biom, "get_models_id_by_name") do
        soap.body = { :modelName => value, :attributes! => { :modelName => { "xsi:type" => "xsd:string" } } }  
      end
      return response.to_hash[:get_models_id_by_name_response][:get_models_id_by_name_return][:get_models_id_by_name_return]
    end


    private
   
    def create_connection
      client = Savon::Client.new do
        wsdl.document = "http://www.ebi.ac.uk/biomodels-main/services/BioModelsWebServices?wsdl"
        wsdl.namespace = "http://biomodels.ebi.ac.uk"
      end
    end

  end #SearchBiomodel
end #SysMODB

