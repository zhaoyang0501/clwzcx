package seed.sys.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seed.common.service.SimpleCurdService;
import seed.sys.entity.Car;
import seed.sys.repository.CarRepository;

@Service
public class CarService extends SimpleCurdService<Car, Long> {
	
	@Autowired
	CarRepository carRepository;
	public List<Car> findByIdcard(String id){
		return carRepository.findByIdcard(id);
	}
}
