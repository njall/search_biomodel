require 'savon'
require 'singleton'

module SysMODB

  class SearchBiomodelException < Exception
  end

  class SearchBiomodel
    include Singleton

    def initialize
      @connection = Savon.configure do |config|
        config.log = false
        HTTPI.log = false
        config.raise_errors = true
        Savon::Client.new do
          wsdl.document = "http://www.ebi.ac.uk/biomodels-main/services/BioModelsWebServices?wsdl"
          wsdl.namespace = "http://biomodels.ebi.ac.uk"
        end
      end

    end


    def models(search_string)
      #collect results from sub-methods
      results = Array.new
      results << @connection.search_by_name(search_string)
      results << @connection.search_by_chebiid(search_string)
      results << @connection.search_by_person(search_string)

      #turn into one big array, remove duplicates and select first X
      results = results.flatten
      results = results.uniq
      results = results.first(10)

      sbml_results = Array.new

      results.each_with_index do |a, i| 
         sbml_results[i] = Hash.new 
         sbml_results[i] = Nori.parse(@connection.getSimpleModel(a))[:simple_models][:simple_model] 
      end
      sbml_results
    end



    def getModel(model_id)
      client = connection
      response = client.request(:biom, "get_model_by_id") do
        soap.body = {:id => model_id, :attributes! => {:id => {"xsi:type" => "xsd:string"}}}
      end

      search_results = response.to_hash[:get_model_by_id_response][:get_model_by_id_return]
      if search_results.nil?
        []
      else
        search_results
      end
    end



    def getSimpleModel(model_id)
      client = connection
      response = client.request(:biom, "get_simple_model_by_id") do
        soap.body = {:id => model_id, :attributes! => {:id => {"xsi:type" => "xsd:string"}}}
      end

      search_results = response.to_hash[:get_simple_model_by_id_response][:get_simple_model_by_id_return]

      if search_results.nil?
        []
      else
        search_results
      end
    end

    #search_by_chebiid
    #search_by_name
    #search_by_person

    def search_by_chebiid(search_string)
      client = connection
      response = client.request(:biom, "get_models_id_by_ch_ebi_id") do
        soap.body = {:ChEBBId => search_string, :attributes! => {:ChEBBId => {"xsi:type" => "xsd:string"}}}
      end

      search_results = response.to_hash[:get_models_id_by_ch_ebi_id_response][:get_models_id_by_ch_ebi_id_return][:get_models_id_by_ch_ebi_id_return]
      if search_results.nil?
        []
      else
        search_results
      end
    end


    def search_by_name (search_string)
      client = connection
      response = client.request(:biom, "get_models_id_by_name") do
        soap.body = {:modelName => search_string, :attributes! => {:modelName => {"xsi:type" => "xsd:string"}}}
      end
      search_results = response.to_hash[:get_models_id_by_name_response][:get_models_id_by_name_return][:get_models_id_by_name_return]
      if search_results.nil?
        []
      else
        search_results
      end
    end

    def search_by_person (search_string)
      client = connection
      response = client.request(:biom, "get_models_id_by_person") do
        soap.body = {:personName => search_string, :attributes! => {:personName => {"xsi:type" => "xsd:string"}}}
      end
      search_results = response.to_hash[:get_models_id_by_person_response][:get_models_id_by_person_return][:get_models_id_by_person_return]
      if search_results.nil?
        []
      else
        search_results
      end
    end


    #more used for testing

    def get_model_name_by_id (search_string)
      client = connection
      response = client.request(:biom, "get_model_name_by_id") do
        soap.body = {:id => search_string, :attributes! => {:id => {"xsi:type" => "xsd:string"}}}
      end
      search_results = response.to_hash[:get_model_name_by_id_response][:get_model_name_by_id_return]
      if search_results.nil? || search_results.include?('is an invalid Model ID.')
        []
      else
        search_results
      end
    end

    def get_all_models
      client = connection
      response = client.request(:biom, "get_all_models") do
        soap.body = {:modelName => "?", :attributes! => {:modelName => {"xsi:type" => "xsd:string"}}}
      end
      search_results = response.to_hash[:multi_ref][:item]
      if search_results.nil?
        []
      else
        search_results
      end
    end




    protected

    def connection
      @connection
    end

  end #SearchBiomodel
end #SysMODB

