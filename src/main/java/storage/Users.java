package storage;

import domain.User;

import java.util.ArrayList;
import java.util.List;

public class Users {
    private final static List<User> users = new ArrayList<>();

    public static List<User> getUsers() {
        return new ArrayList<>(users);
    }

    public static void addUser(User u) {
        users.add(u);
    }
}
