Feature: Pokemon API Test

    Background:
        * url 'https://pokeapi.co/api/v2/'

    Scenario: Get Pokemon details - 200 OK
        * def namePokemon = 'squirtle'
        Given path 'pokemon/', namePokemon
        When method Get
        Then status 200
        Then match response.name == namePokemon

    
    @sortSyntax
    Scenario: Get Pokemon moves and sort them alphabetically with short syntax
        * def namePokemon = 'bulbasaur'
        Given path 'pokemon/', namePokemon
        When method Get
        Then status 200
        * def moves = get response.moves[*].move.name
        * def sortedMoves = moves.sort()
        * print sortedMoves

    @bubbleSortIteration
    Scenario: Get Pokemon moves and sort them alphabetically with iteration
        * def namePokemon = 'bulbasaur'
        Given path 'pokemon/', namePokemon
        When method Get
        Then status 200
        * def moves = response.moves
        * def moveNames = []
        * karate.forEach(moves, function(move){moveNames.push(move.move.name)})
        * def bubbleSort =
        """
        function(arr){
            var len = arr.lenght;
            for(var i = 0; i < len; i++){
                for(var j = 0; j < len - i - 1; j++){
                    if (arr[j] > arra [j +1]){
                        var temp = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = temp;
                    }
                }
            }
            return arr; 
        }
        """
        * def sortedMoves = bubbleSort(moveNames)
        * print sortedMoves

    