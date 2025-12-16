package pokemon;
import com.intuit.karate.junit5.Karate;

public class RunnerPokemon {

    @Karate.Test
    Karate testPokemon() {
        return Karate.run("pokemon").relativeTo(getClass());
    }    
    
}
