package org.uestc.dao;

import java.sql.SQLException;
import java.text.ParseException;

import org.apache.commons.dbutils.QueryRunner;
import org.uestc.util.JdbcUtils;
import org.uestc.util.PageBean;

import com.uestc.bean.Sale;

public interface QSFXDao {

	public QueryRunner qr = new QueryRunner(JdbcUtils.getInstance().getDataSource());

	PageBean<Sale> findAllSalesByUid(Long uId, int pc) throws SQLException;
	
	PageBean<Sale> findByCombination(String storeName, String beginTime, String endTime, String condition, Long uId, int pc) throws SQLException, ParseException;
}
