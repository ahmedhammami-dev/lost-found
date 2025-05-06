package lostfound.lostfound.service;

import lostfound.lostfound.model.Item;

import java.util.List;

public interface IItemService {
    Item addItem (Item item);
    List<Item> retrieveAllItems();
}
