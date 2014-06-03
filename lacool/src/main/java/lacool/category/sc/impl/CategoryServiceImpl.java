package lacool.category.sc.impl;

import java.util.List;

import lacool.category.mapper.CategoryMapper;
import lacool.category.sc.CategoryService;
import lacool.category.vo.CategoryVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public void insertMainCategory(CategoryVo vo) {
		vo.setPrefix("A");
		categoryMapper.insertCategory(vo);
	}
	
	@Override
	public void insertSubCategory(CategoryVo vo) {
		vo.setPrefix("B");
		categoryMapper.insertCategory(vo);
	}

	@Override
	public List<CategoryVo> listCategory(CategoryVo vo) {
		return categoryMapper.listCategory(vo);
	}

}
