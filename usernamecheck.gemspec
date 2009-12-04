# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{usernamecheck}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller"]
  s.date = %q{2009-12-03}
  s.default_executable = %q{usernamecheck}
  s.description = %q{Checks username availability on many populer sites.}
  s.email = %q{elijah.miller@gmail.com}
  s.executables = ["usernamecheck"]
  s.extra_rdoc_files = ["bin/usernamecheck", "CHANGELOG", "lib/username_check.rb", "LICENSE", "README.rdoc"]
  s.files = ["bin/usernamecheck", "CHANGELOG", "lib/username_check.rb", "LICENSE", "Manifest", "Rakefile", "README.rdoc", "usernamecheck.gemspec"]
  s.homepage = %q{http://usernamecheck.rubyforge.org}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Usernamecheck", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{usernamecheck}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Checks username availability on many populer sites.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
