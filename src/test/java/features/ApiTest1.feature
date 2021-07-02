Feature: exhcnge rate api tests
  # API Access Key --> unique 30446c4718aa5513eb2fcae29599aad3

  Scenario: basic test with status code validation
    Given url 'http://api.exchangeratesapi.io/v1/latest?access_key=30446c4718aa5513eb2fcae29599aad3'
    When method GET
    Then status 200


  Scenario: get rates for specific day
    Given url "https://api.exchangeratesapi.io/v1/2013-12-24?access_key=30446c4718aa5513eb2fcae29599aad3&base=GBP"
    When method GET
    Then status 200

  Scenario: header verification
    Given url 'https://api.exchangeratesapi.io/v1/latest?access_key=30446c4718aa5513eb2fcae29599aad3'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Vary == 'Accept-Encoding'
    And match header Connection == 'Keep-Alive'
    # to verify headers we use header keyword then headername without double or single quote
    # and == 'header value'
    And match header Date == '#present'
    #this equals to header().hasHeaderWithName("headerName") in rest assured

  Scenario: json body verification
    Given url 'http://api.exchangeratesapi.io/v1/latest?access_key=30446c4718aa5513eb2fcae29599aad3'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And print response.base
    #verify base is EUR
    And match response.base == 'EUR'
    And response.rates.USD == '#present'

