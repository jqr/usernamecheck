# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{usernamecheck}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller"]
  s.date = %q{2009-02-20}
  s.default_executable = %q{usernamecheck}
  s.description = %q{A command line replacement for usernamecheck.com.}
  s.email = %q{elijah.miller@gmail.com}
  s.executables = ["usernamecheck"]
  s.extra_rdoc_files = ["bin/usernamecheck", "CHANGELOG", "lib/username_check.rb", "LICENSE", "README.rdoc"]
  s.files = ["bin/usernamecheck", "CHANGELOG", "lib/username_check.rb", "LICENSE", "Manifest", "Rakefile", "README.rdoc", "usernamecheck.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://usernamecheck.rubyforge.org}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Usernamecheck", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{usernamecheck}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A command line replacement for usernamecheck.com.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
