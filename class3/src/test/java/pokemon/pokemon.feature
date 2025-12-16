Feature: Pokemon API Test

    Background:
        * url 'https://pokeapi.co/api/v2/'

    Scenario: Get Pokemon details - 200 OK
        * def namePokemon = 'squirtle'
        Given path 'pokemon/', namePokemon
        When method Get
        Then status 200
        Then match response.name == namePokemon