package seed.sys.service;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import seed.common.service.SimpleCurdService;
import seed.core.entity.User;
import seed.sys.entity.Article;
import seed.sys.repository.ArticleRepository;

@Service
public class ArticleService extends SimpleCurdService<Article, Long> {
	
	public static final int PAGE_SIZE=20;
	
	@Autowired
	public ArticleRepository articleRepository;
	
	
	public List<Article> findByUser(User user){
		return this.articleRepository.findByUserOrderByCreateDate(user);
	}
	
	public Page<Article> findAll(final int pageNumber, final int pageSize,final String title,final Long categoryid){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (StringUtils.isNotBlank(title)) {
                  predicate.getExpressions().add(cb.like(root.get("title").as(String.class), "%"+title+"%"));
             }
             return predicate;
             }
        };
        Page<Article> result = (Page<Article>) simpleCurdRepository.findAll(spec, pageRequest);
        return result;
  }

}
