require 'rubygems'
require 'savon'


module SysMODB

  class SearchBiomodelException < Exception
  end

  module SearchBiomodel
   
    def search_by_ChEBIID(search_string)
      client = create_connection
      response = client.request(:biom, "get_models_id_by_ch_ebi_id") do
        soap.body = { :ChEBBId => search_string, :attributes! => { :ChEBBId => { "xsi:type" => "xsd:string" } } }  
      end
      return response.to_hash[:get_models_id_by_ch_ebi_id_response][:get_models_id_by_ch_ebi_id_return][:get_models_id_by_ch_ebi_id_return]
    end
    

    def get_all_models
      client = create_connection  
      response = client.request(:biom, "get_all_models" ) do
        soap.body = { :modelName => "?", :attributes! => { :modelName => { "xsi:type" => "xsd:string" } } }
      end
      return response.to_hash[:multi_ref][:item]
    end
  

    def search_by_name (search_string)
      client = create_connection
      response = client.request(:biom, "get_models_id_by_name") do
        soap.body = { :modelName => search_string, :attributes! => { :modelName => { "xsi:type" => "xsd:string" } } }  
      end
      return response.to_hash[:get_models_id_by_name_response][:get_models_id_by_name_return][:get_models_id_by_name_return]
    end


    private
   
    def create_connection
      Savon.configure do |config|
        config.log = false
        HTTPI.log = false
        client = Savon::Client.new do
          wsdl.document = "http://www.ebi.ac.uk/biomodels-main/services/BioModelsWebServices?wsdl"
          wsdl.namespace = "http://biomodels.ebi.ac.uk"
        end #client
      end #configure
    end #create_connection


  end #SearchBiomodel
end #SysMODB

