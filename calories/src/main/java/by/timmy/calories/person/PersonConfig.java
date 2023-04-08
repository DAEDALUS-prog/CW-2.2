package by.timmy.calories.person;


import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class PersonConfig {

    @Bean
    CommandLineRunner commandLineRunner(PersonRepository repository) {
        return args -> {
            Person timmy = new Person(
                    "Timmy",
                    "timmy@gmail.com",
                    1,
                    "12345"
            );

            Person dan = new Person(
                    "Dan",
                    "dan@gmail.com",
                    1,
                    "54321"
            );

            repository.saveAll(
                    List.of(timmy, dan)
            );
        };
    }

}
