require '../matz/dsl_xml'

pagetitle = 'Test page for xml generate'
XML.generate(STDOUT) do
  html do
    head do
      title {pagetitle}
      comment 'this is a test'
    end
    body do
      h1(:style=>'font-family:scan-serif') {pagetitle}
      ul :type=>'square' do
        li {Time.now}
        li {RUBY_VERSION}
      end
    end
  end
end