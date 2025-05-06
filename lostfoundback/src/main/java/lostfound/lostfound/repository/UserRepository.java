package lostfound.lostfound.repository;

import lostfound.lostfound.model.Item;
import lostfound.lostfound.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
}
