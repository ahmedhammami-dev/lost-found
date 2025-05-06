package lostfound.lostfound.service;

import lostfound.lostfound.model.Item;
import lostfound.lostfound.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ItemServiceImpl implements IItemService{
   @Autowired
    ItemRepository itemRepository;

    @Override
    public Item addItem(Item item) {
        return itemRepository.save(item);
    }

    @Override
    public List<Item> retrieveAllItems() {
        return itemRepository.findAll();
    }
}
