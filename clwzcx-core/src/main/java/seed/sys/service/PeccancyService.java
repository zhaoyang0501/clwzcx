package seed.sys.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seed.common.service.SimpleCurdService;
import seed.sys.entity.Peccancy;
import seed.sys.repository.PeccancyRepository;

@Service
public class PeccancyService extends SimpleCurdService<Peccancy, Long> {
	
	@Autowired
	PeccancyRepository peccancyRepository;
	
	public List<Peccancy> findByEnginenum(String num){
		return peccancyRepository.findByEnginenum(num);
	}
}
