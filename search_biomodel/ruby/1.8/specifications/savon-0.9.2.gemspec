# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{savon}
  s.version = "0.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Harrington"]
  s.date = %q{2011-04-29}
  s.description = %q{Savon is the heavy metal Ruby SOAP client}
  s.email = %q{me@rubiii.com}
  s.files = [".gitignore", ".rspec", ".travis.yml", ".yardopts", "CHANGELOG.md", "Gemfile", "LICENSE", "README.md", "Rakefile", "lib/savon.rb", "lib/savon/client.rb", "lib/savon/core_ext/hash.rb", "lib/savon/core_ext/object.rb", "lib/savon/core_ext/string.rb", "lib/savon/core_ext/time.rb", "lib/savon/error.rb", "lib/savon/global.rb", "lib/savon/http/error.rb", "lib/savon/soap.rb", "lib/savon/soap/fault.rb", "lib/savon/soap/request.rb", "lib/savon/soap/response.rb", "lib/savon/soap/xml.rb", "lib/savon/version.rb", "lib/savon/wsdl/document.rb", "lib/savon/wsdl/parser.rb", "lib/savon/wsdl/request.rb", "lib/savon/wsse.rb", "savon.gemspec", "spec/fixtures/gzip/message.gz", "spec/fixtures/response/another_soap_fault.xml", "spec/fixtures/response/authentication.xml", "spec/fixtures/response/header.xml", "spec/fixtures/response/list.xml", "spec/fixtures/response/multi_ref.xml", "spec/fixtures/response/soap_fault.xml", "spec/fixtures/response/soap_fault12.xml", "spec/fixtures/wsdl/authentication.xml", "spec/fixtures/wsdl/geotrust.xml", "spec/fixtures/wsdl/namespaced_actions.xml", "spec/fixtures/wsdl/no_namespace.xml", "spec/fixtures/wsdl/soap12.xml", "spec/fixtures/wsdl/two_bindings.xml", "spec/savon/client_spec.rb", "spec/savon/core_ext/hash_spec.rb", "spec/savon/core_ext/object_spec.rb", "spec/savon/core_ext/string_spec.rb", "spec/savon/core_ext/time_spec.rb", "spec/savon/http/error_spec.rb", "spec/savon/savon_spec.rb", "spec/savon/soap/fault_spec.rb", "spec/savon/soap/request_spec.rb", "spec/savon/soap/response_spec.rb", "spec/savon/soap/xml_spec.rb", "spec/savon/soap_spec.rb", "spec/savon/wsdl/document_spec.rb", "spec/savon/wsdl/parser_spec.rb", "spec/savon/wsdl/request_spec.rb", "spec/savon/wsse_spec.rb", "spec/spec_helper.rb", "spec/support/endpoint.rb", "spec/support/fixture.rb"]
  s.homepage = %q{http://savonrb.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{savon}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Heavy metal Ruby SOAP client}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<nori>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<httpi>, [">= 0.7.8"])
      s.add_runtime_dependency(%q<gyoku>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.4.0"])
      s.add_development_dependency(%q<autotest>, [">= 0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9.8"])
      s.add_development_dependency(%q<timecop>, ["~> 0.3.5"])
    else
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<nori>, [">= 0.2.0"])
      s.add_dependency(%q<httpi>, [">= 0.7.8"])
      s.add_dependency(%q<gyoku>, [">= 0.4.0"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.0"])
      s.add_dependency(%q<rspec>, ["~> 2.4.0"])
      s.add_dependency(%q<autotest>, [">= 0"])
      s.add_dependency(%q<mocha>, ["~> 0.9.8"])
      s.add_dependency(%q<timecop>, ["~> 0.3.5"])
    end
  else
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<nori>, [">= 0.2.0"])
    s.add_dependency(%q<httpi>, [">= 0.7.8"])
    s.add_dependency(%q<gyoku>, [">= 0.4.0"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.0"])
    s.add_dependency(%q<rspec>, ["~> 2.4.0"])
    s.add_dependency(%q<autotest>, [">= 0"])
    s.add_dependency(%q<mocha>, ["~> 0.9.8"])
    s.add_dependency(%q<timecop>, ["~> 0.3.5"])
  end
end
