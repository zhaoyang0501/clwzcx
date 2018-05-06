package seed.sys.repository;
import java.util.List;

import seed.common.repository.SimpleCurdRepository;
import seed.sys.entity.Car;
public interface CarRepository   extends SimpleCurdRepository<Car ,Long>{

	List<Car> findByIdcard(String id);
}
