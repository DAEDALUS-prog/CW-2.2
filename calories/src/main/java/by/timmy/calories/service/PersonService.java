package by.timmy.calories.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.timmy.calories.models.Person;
import by.timmy.calories.repository.PersonRepository;

@Service
public class PersonService {

    @Autowired
    private PersonRepository personRepository;

    public Person findByEmail(String email) {
        return personRepository.findByEmail(email);
    }

    @Transactional
    public void save(Person person) {
        personRepository.save(person);
    }

    public boolean checkEmail(String email, String password) {
        Person person = personRepository.findByEmail(email);
        if (person != null && person.getPassword().equals(password)) {
            return true;
        }
        return false;
    }


}
