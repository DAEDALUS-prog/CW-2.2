package by.timmy.calories.user;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    public List<User> getUsers() {
        return List.of(
                new User (1L,
                        "Timmy",
                        "timmy@gmail.com",
                        1,
                        "12345")
        );
    }
}
