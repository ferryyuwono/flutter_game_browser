Feature: Home
    Background:
        Given Home page is shown

    Scenario: Show Games List
        When Home receives game list
        Then User sees list of game
