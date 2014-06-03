package lacool.category.sc;

import java.util.List;

import lacool.category.vo.CategoryVo;

public interface CategoryService {
	public void insertMainCategory(CategoryVo vo);
	public void insertSubCategory(CategoryVo vo);

	public List<CategoryVo> listCategory(CategoryVo vo);
}
