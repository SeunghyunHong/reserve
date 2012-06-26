package com.narratage.reserve.bbs.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.narratage.reserve.bbs.vo.BbsVo;
	
@Repository("bbsDao")
public class BbsDaoImpl extends SqlSessionDaoSupport implements BbsDao {
	
	@Autowired	
	private SqlSessionFactory sqlSessionFactory;
	
	public BbsVo selectBbsDetail(Integer BbsId) {
		return (BbsVo) getSqlSession().selectList("com.narratage.reserve.bbs.dao.BbsDao.selectBbsDetail", BbsId);	
	}
	
	public List<BbsVo> selectBbsList(BbsVo BbsVo) {
		return null;
	}
	public int insertBbs(BbsVo BbsVo) {
		return 1;
	}
	public int updateBbs(Integer BbsId) {
		return 1;
	}
	public int deleteBbs(Integer BbsId) {
		return 1;
	}
	
	
}


