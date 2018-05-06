package seed.sys.repository;
import java.util.List;

import seed.common.repository.SimpleCurdRepository;
import seed.core.entity.User;
import seed.sys.entity.Sign;
public interface SignRepository   extends SimpleCurdRepository<Sign ,Long>{

	List<Sign> findByUser(User user);
}
