/*
 * 文件名：UserDao.java
 * 版权：Copyright 2012-2016 YLINK Tech. Co. Ltd. All Rights Reserved. 
 * 描述： UserDao.java
 * 修改人：liyuelong 1610139
 * 修改时间：2017年4月20日
 * 修改内容：新增
 */
package com.manager.dao;

import java.io.Serializable;
import java.util.List;

import com.manager.entity.UserInfo;
import com.manager.entity.view.UserInfoView;


/**
 * TODO添加类描述	
 * @author     liyuelong 1610139
 * @version    CCAS 2017年4月20日
 * @since      CCAS
 */
public interface UserDAO extends BaseDAO{
	public int getId();
	public int getcount();
	public List<UserInfo> getAll();
	public UserInfo get(Serializable key);
	public UserInfo getUserInfoByUserLoginId(String userLoginId);
	public UserInfo getUserInfoByUserId(int userId);
	public void saveOrUpdate(UserInfo userInfo);
	/*public boolean delete(UserInfo userInfo);*/
}

