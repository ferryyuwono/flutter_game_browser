Feature: Game Detail
    Scenario: Show Game Detail with No Image
        Given Game detail page is shown
        When Game detail page receives data with no image
        Then User sees detail of game with no image
