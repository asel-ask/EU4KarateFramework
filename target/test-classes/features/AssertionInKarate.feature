Feature: Using match keyword


  Scenario: some matching example
    * def name = 'Severus Snape'
    * match name == 'Severus Snape'
    # similar to Assert.assertEquals(name,"Severus Snape")
    * match name != 'Tom Riddle'


  Scenario: more matching examples
    * def employee =
    """
      {
          "firstName":"TJ",
          "salary":24001,
          "active": true
      }
    """

    * def emp_name = employee.firstName
    * match emp_name == 'TJ'
    * match employee.salary == 24001


  Scenario: fuzzy matching
    * def employee =
    """
    {
          "firstName":"TJ",
          "salary":24001,
          "active": true
    }
    """
   * match employee.firstName == '#string'
   * match employee.salary == '#number'
   * match employee.active == '#boolean'
   * match employee.last_name == '#notpresent'


  Scenario: contains match
    * def employees =
    """[
      {
          "firstName":"TJ",
          "salary":24001,
          "active": true
      },
      {
          "firstName": "Steven",
          "lastName":"king",
          "salary":2099
      }]
    """

    * def length = employees.length
    * print length
    * match length == 2
    * match employees contains any{ "firstName":"TJ","salary":24001,"active": true}