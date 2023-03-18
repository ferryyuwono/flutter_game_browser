Feature: Home
    Scenario: Refresh Game List
        Given Home page is shown
        When Home page receives data
        Then User sees list of game
        Then User pull to refresh the page
        Then User sees list of game
