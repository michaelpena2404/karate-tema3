Feature: Pokemon API Test

    Background:
        * url 'https://pokeapi.co/api/v2/'

    Scenario: Get Pokemon details - 200 OK
        * def namePokemon = 'squirtle'
        Given path 'pokemon/', namePokemon
        When method Get
        Then status 200
        Then match response.name == namePokemon

    
    @shortSyntax
    Scenario: Get Pokemon moves and sort them alphabetically with short syntax
        * def namePokemon = 'bulbasaur'
        Given path 'pokemon/', namePokemon
        When method Get
        Then status 200
        * def moves = get response.moves[*].move.name
        * def sortedMoves = moves.sort()
        * print sortedMoves

        