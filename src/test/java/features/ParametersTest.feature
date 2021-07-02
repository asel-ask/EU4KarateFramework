Feature: Parameters examples

  Background:
    * def baseUrl = 'http://api.exchangeratesapi.io/v1?access_key=30446c4718aa5513eb2fcae29599aad3'
    * def spartanUrl = 'http://34.228.41.120:8000'
    * def hrUrl = 'http://34.228.41.120:1000/ords/hr'

  Scenario: path parameters
    Given url baseUrl
    And path "latest"
    When method GET
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12"
    When method GET
    Then status 200

  Scenario: get all spartans with path
    Given url spartanUrl
    And path 'api/spartans'
    When method Get
    Then status 200
    And print response

  Scenario: get one spartan with path
    Given url spartanUrl
    And path 'api/spartans'
    And path '632'
    When method Get
    Then status 200
    And print response
    And match response == {"gender": "Female","phone": 2786952162,"name": "Lucais","id": 632}
    
  
  Scenario: get one spartan with path
    * def expectedSpartan =
  """
      {
        "gender": "Female",
        "phone": 2786952162,
        "name": "Lucais",
        "id": 632
      }
  """
    Given url spartanUrl
    And path 'api/spartans'
    And path '632'
    When method Get
    Then status 200
    And print response
    And match response == expectedSpartan

  
  Scenario: query params
    Given url spartanUrl
    And path 'api/spartans/search'
    And param nameContains = 'j'
    And param gender = 'Female'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And match response.pageable.pageNumber == 0
    #verify each content has gender == Female
    And match each response.content contains {"gender":"Female"}
    #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Jessica'
    #verify each content phone is number
    And match each response.content[*].phone == '#number'


  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method GET
    Then status 200
    And print response
    And match response.limit == 25
    And match each response.items[*].region_id == '#number'






    