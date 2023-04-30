package by.timmy.calories.repository;

import org.springframework.data.repository.CrudRepository;
import by.timmy.calories.models.Person;;

public interface PersonRepository extends CrudRepository<Person, Long>{
    Person findByEmail(String email);
}
