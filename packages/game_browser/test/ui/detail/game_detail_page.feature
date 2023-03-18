Feature: Game Detail
    Background:
        Given Game detail page is shown

    Scenario: Show Game Detail
        When Game detail page receives game detail
        Then User sees detail of game
