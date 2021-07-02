Feature: Welcome to karate
  
  Scenario: how to print
    Given print 'Hello World'
    When print "another print"
    Then print 'the print'
    
    Scenario: more printing
      Given print 'some words to print'
      * print 'my name is','karate kid'
      # , --> concat 2 strings +1 with space
      * print 2+2
      
      
      Scenario: variables
        * def name = 'Mike'
        * print 'my name is',name
        * def age = 20
        * print name,'is',age,'years old'


     Scenario: Difficult parameters: json object
        * def student = {'name':'sam','owes_tution':false}
        * print student
        # get me just a name
        * print student.name
        # get me just owes_tution
        * print student.owes_tution


    Scenario: json object 2
          * def student =
          """
          {
          "firstName": "Steven",
          "lastName":"king",
          "salary":2099
          }
          """
          * print student.firstName

    Scenario: Spartan variable
      * def spartan =
      """
      {
    "id": 603,
    "name": "BlaBla",
    "gender": "Male",
    "phone": 12345647895
      }
      """
      * print spartan.gender
      * print spartan.name
      * print spartan.phone
      * print spartan.id


    Scenario: json array objects
      * def students =
      """
      [
        {
        'name':'sam',
        'owes_tution':false
        },
        {
        'name':'Mike',
        'owes_tution':true
        },
      ]
      """

      * print students
      * print students[0].name
      * print students[1].owes_tution