# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{search_biomodel}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Niall Beard"]
  s.date = %q{2011-06-28}
  s.description = %q{Client package for creating, sending, recieving and consuming SOAP messages from BioModels search engine }
  s.email = %q{beardn9@cs.man.ac.uk}
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = [".document", "Gemfile", "Gemfile.lock", "LICENSE.txt", "README.rdoc", "Rakefile", "VERSION", "lib/search_biomodel.rb", "search_biomodel.gemspec", "test/helper.rb", "test/test_search_biomodel.rb"]
  s.homepage = %q{http://github.com/njall/search_biomodel}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Interfaces with BioModel search engine}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<savon>, ["~> 0.9.2"])
    else
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<savon>, ["~> 0.9.2"])
    end
  else
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<savon>, ["~> 0.9.2"])
  end
end
