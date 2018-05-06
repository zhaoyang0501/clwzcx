package seed.sys.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seed.common.service.SimpleCurdService;
import seed.core.entity.User;
import seed.sys.entity.Action;
import seed.sys.entity.Sign;
import seed.sys.repository.SignRepository;

@Service
public class SignService extends SimpleCurdService<Sign, Long> {
	
	
	@Autowired
	private SignRepository signRepository;
	
	public List<Sign> findByUser(User user){
		return signRepository.findByUser(user);
	}
	
}
