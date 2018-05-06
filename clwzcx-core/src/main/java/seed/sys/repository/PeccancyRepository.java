package seed.sys.repository;
import java.util.List;

import seed.common.repository.SimpleCurdRepository;
import seed.sys.entity.Peccancy;
public interface PeccancyRepository   extends SimpleCurdRepository<Peccancy ,Long>{
	
	public List<Peccancy> findByEnginenum(String num);
}
