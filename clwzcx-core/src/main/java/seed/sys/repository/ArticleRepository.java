package seed.sys.repository;
import java.util.List;

import seed.common.repository.SimpleCurdRepository;
import seed.core.entity.User;
import seed.sys.entity.Article;
public interface ArticleRepository   extends SimpleCurdRepository<Article ,Long>{
	
	public List<Article> findByUserOrderByCreateDate(User user);

}
