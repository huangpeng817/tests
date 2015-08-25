package org.uestc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.uestc.service.InventoryWarningService;
import org.uestc.service.ZBTJService;
import org.uestc.serviceImp.InventoryWarningServiceImp;
import org.uestc.serviceImp.ZBTJServiceImp;
import org.uestc.util.PageBean;

import com.uestc.bean.Goods;
import com.uestc.bean.Sale;
import com.uestc.bean.Store;
import com.uestc.bean.Users;

import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class ZBTJServlet
 */
@WebServlet("/ZBTJServlet")
public class ZBTJServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private InventoryWarningService inventoryWarningService = new InventoryWarningServiceImp();
	private ZBTJService zbtjService = new ZBTJServiceImp();
	
	public String initLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users user = (Users) request.getSession().getAttribute("sessionUser");
		List<Store> storeList = inventoryWarningService.findAllStoresByUid(user.getUId());
		request.setAttribute("storeList", storeList);
		
		int pc = getPc(request);
		String url = getUrl(request);
		
		PageBean<Sale> pb = zbtjService.findAllSalesByUid(user.getUId(), pc);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		
		return "f:/pages/sales/zbtj.jsp";
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
	
//	@Test
//	public void testInitLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		initLoad(request, response);
//
//	}
}
