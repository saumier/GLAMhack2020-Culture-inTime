class SparqlLoaderTest < ActionView::TestCase
  
  test "do load SPARQL from url" do
    expected = 'PREFIX schema: <http://schema.org/> select * where { <http://replaced.com> ^schema:superEvent ?event . OPTIONAL { ?event schema:startDate ?startDate . } OPTIONAL { ?event schema:url ?webpage . } OPTIONAL { ?event schema:offers/schema:url ?offer_url } } limit 100'
    loader = SparqlLoader
    url = 'https://raw.githubusercontent.com/culturecreates/Culture-inTime/master/app/services/sparqls/canadian_performances.sparql'
    actual = loader.load_url(url, 'http://kg.artsdata.ca/resource/dansedanse-ca_animals-distinction-frontera', 'http://replaced.com').squish
    assert_equal expected, actual
  end

  test "do load SPARQL with invalid url" do
    expected = {:error=>'\'httppppp://empty.com/\' Must be HTTP, HTTPS or Generic'}
    loader = SparqlLoader
    url = 'httppppp://empty.com/'
    actual = loader.load_url(url)
    assert_equal expected, actual
  end

  test "do load SPARQL with 404 error" do
    expected = 404
    loader = SparqlLoader
    url = 'http://google.com/nopage.html'
    actual = loader.load_url(url)[:error]
    assert_equal expected, actual
  end

end
