package org.uestc.service;

import java.util.List;

import org.uestc.dao.AuditOrderDao;
import org.uestc.daoImp.AuditOrderDaoImp;
import org.uestc.util.PageBean;

import com.uestc.bean.Booking;

public interface AuditOrderService {

	public AuditOrderDao auditOrderDao = new AuditOrderDaoImp();
	
	PageBean<Booking> findAllBookingByUid(Long uId, int pc);

	List<String> findAllDate();

	PageBean<Booking> findByCombination(String bookingNo, String date, String storeName, String status, Long uId,
			int pc);

}
