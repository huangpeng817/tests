package org.uestc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.uestc.service.AuditOrderService;
import org.uestc.service.InventoryWarningService;
import org.uestc.serviceImp.AuditOrderServiceImp;
import org.uestc.serviceImp.InventoryWarningServiceImp;
import org.uestc.util.PageBean;

import com.uestc.bean.Booking;
import com.uestc.bean.OrderItem;
import com.uestc.bean.Store;
import com.uestc.bean.Users;

import cn.itcast.servlet.BaseServlet;
@WebServlet(name="AuditOrderServlet",urlPatterns="/AuditOrderServlet")
public class AuditOrderServlet extends BaseServlet {
	
	private static final long serialVersionUID = -5303344441324211748L;
	
	private InventoryWarningService inventoryWarningService = new InventoryWarningServiceImp();
	private AuditOrderService auditOrderService = new AuditOrderServiceImp();

	public String findByCombination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users user = (Users) request.getSession().getAttribute("sessionUser");
		List<Store> storeList = inventoryWarningService.findAllStoresByUid(user.getUId());
		request.setAttribute("storeList", storeList);
		List<String> dateList = auditOrderService.findAllDate();
		request.setAttribute("dateList", dateList);
		
		String bookingNo = request.getParameter("bookingNo");
		String date = request.getParameter("date");
		String storeName = request.getParameter("storeName");
		String status = request.getParameter("status");
		
		request.setAttribute("bookingNo", bookingNo);
		request.setAttribute("date", date);
		request.setAttribute("storeName", storeName);
		request.setAttribute("status", status);
		
		int pc = getPc(request);
		String url = getUrl(request);
		
		PageBean<Booking> pb = null;
		pb = auditOrderService.findByCombination(bookingNo, date, storeName, status, user.getUId() ,pc);
		
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		
		return "f:/pages/admin/admin-audit-order.jsp";
	}
	
	public String getBookingDetailByBNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bno = request.getParameter("bno");
//		System.out.println("当前订单号： " + bno);
		
		List<OrderItem> orderItemList = auditOrderService.findByBNo(bno);
		// 思路：1.构造json数组，页面遍历json数组
		// 构造json数组
		StringBuilder sb = new StringBuilder("[");
		
		int index = 0; // 标记最后一个json对象
		for (OrderItem orderItem : orderItemList) {
			index++;
			sb.append("{");
			
			// 构造json对象
			sb.append("\"barcode\"").append(":").append("\""+orderItem.getBarcode()+"\"");
			sb.append(","); // 数据由逗号分隔
			sb.append("\"gName\"").append(":").append("\""+orderItem.getgName()+"\"");
			sb.append(","); 
			sb.append("\"gNum\"").append(":").append("\""+orderItem.getgNum()+"\"");
			sb.append(","); 
			sb.append("\"price\"").append(":").append("\""+orderItem.getPrice()+"\"");
			
			if (index == orderItemList.size()) {
				sb.append("}");
			} else {
				sb.append("},");
			}
		}
		sb.append("]");
//		System.out.println(sb.toString());
		response.getWriter().print(sb); // 将构造的json数组写回客户端
		
//		boolean b = true;
//		response.getWriter().print(b); // 将结果写回客户端
		return null;
//		return "f:/pages/admin/admin-audit-order.jsp";
	}
	
	public String initLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Users user = (Users) request.getSession().getAttribute("sessionUser");
		List<Store> storeList = inventoryWarningService.findAllStoresByUid(user.getUId());
		request.setAttribute("storeList", storeList);
		
		List<String> dateList = auditOrderService.findAllDate();
		request.setAttribute("dateList", dateList);
		
		int pc = getPc(request);
		String url = getUrl(request);
		
		PageBean<Booking> pb = auditOrderService.findAllBookingByUid(user.getUId(), pc);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		
		return "f:/pages/admin/admin-audit-order.jsp";
	}
	
	private int getPc(HttpServletRequest request) {
		int pc = 1;
		String pcParam = request.getParameter("pc");
		if (pcParam != null) {
			if (!pcParam.trim().isEmpty()) {
				try {
					pc = Integer.parseInt(pcParam);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		}
		return pc;
	}

	private String getUrl(HttpServletRequest request) {
		String url = request.getRequestURI() + "?" + request.getQueryString();
		// 如果url中存在pc参数，截取掉，如果不存在就不用截取
		int index = url.lastIndexOf("&pc");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
}
