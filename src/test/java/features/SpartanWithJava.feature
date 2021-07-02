Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://34.228.41.120:8000'

    Scenario: Get a spartan with request header
      Given url spartanUrl
      And path "api/spartans"
      And header Accept = 'application/json'
      When method GET
      Then status 200


  Scenario: Create a new spartan
    Given  url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
    {
        "gender": "Female",
         "name": "Lorenza",
         "phone": 3123781237
    }
    """
    When method POST
    Then status 201
    And print response

    Scenario: Create a new spartan
      Given url spartanUrl
      And path 'api/spartans'
      And header Accept = 'application/json'
      And header Content-Type = 'application/json'
      And request
      """
     {
        "name":"Katrine",
        "phone":0555647896,
        "gender":"Female"
     }
      """
      When method POST
      Then status 201
      And print response

    Scenario: reading java metod (point the clASS)
    #Java.type --> used to connect to java class
      * def SpartanDataGenerator = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan = SpartanDataGenerator.createSpartan()
    #run the static method in that class and capture the result
    #the return map object is represented as a Java
      * print newSpartan

    Scenario: Create a spartan with Random Data (Java) and delete it
      * def SDG = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan =  SDG.createSpartan()
      Given url spartanUrl
      And path 'api/spartans'
      And header Accept = 'application/json'
      And header Content-Type = 'application/json'
      And request newSpartan
      When method POST
      Then status 201
      And print response
      And match response.success == 'A Spartan is Born!'
      #verify names
      And match response.data.name == newSpartan.name
    And def IDtoDelete = response.data.id
    Given url spartanUrl
    And path 'api/spartans',IDtoDelete
    When method DELETE
    Then status 204