package lostfound.lostfound.controller;

import lostfound.lostfound.model.Item;
import lostfound.lostfound.model.User;
import lostfound.lostfound.service.IItemService;
import lostfound.lostfound.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @Autowired
    IUserService userService;

    @PostMapping("/adduser")
    public User addUser(@RequestBody User user) {
        return userService.addUser(user);
    }
}
