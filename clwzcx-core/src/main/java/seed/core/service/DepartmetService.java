package seed.core.service;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seed.common.exception.AlreadyExistedException;
import seed.common.service.SimpleCurdService;
import seed.core.entity.Department;
import seed.core.entity.Role;
import seed.core.entity.User;
import seed.core.repository.RoleRepository;
import seed.core.repository.UserRepository;

@Service
public class DepartmetService extends SimpleCurdService<Department, Long> {
	
	
}
