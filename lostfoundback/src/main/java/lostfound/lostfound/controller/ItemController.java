package lostfound.lostfound.controller;

import lostfound.lostfound.model.Item;
import lostfound.lostfound.service.IItemService;
import lostfound.lostfound.service.ItemServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ItemController {
    @Autowired
    IItemService itemService;

    @PostMapping("/additem")
    public Item addItem(@RequestBody Item item) {
        return itemService.addItem(item);
    }

    @GetMapping("/retrieve")
    public List<Item> retrieveAllItems() {
        return itemService.retrieveAllItems();
    }


}
