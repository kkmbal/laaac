package lacool.category.mapper;

import java.util.List;

import lacool.category.vo.CategoryVo;

import org.springframework.stereotype.Repository;

@Repository("categoryMapper")
public interface CategoryMapper {
	public void insertCategory(CategoryVo vo);

	public List<CategoryVo> listCategory(CategoryVo vo);
}
