package org.uestc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.uestc.serviceImp.MemInformServiceImp;

/**
 * Servlet implementation class shmeminforminitpaging
 */
@WebServlet(urlPatterns = "/shmeminforminitpaging", name = "shmeminforminitpagingServlet")
public class shmeminforminitpaging extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String which = request.getParameter("which");// 所进行的操作
		int pageno = Integer.parseInt(request.getParameter("pageno").toString());// 当前的页数
		int nowpage = 0;
		// 获取总共有多少页
		List<Object[]> shshowinform = null;
		String pldsh = "select a.v_id,a.v_card_no,a.vip_name,a.vip_tel,a.v_level,a.v_balance,a.v_commodity_integral,b.s_name,a.vip_startdate, a.v_status FROM vip a LEFT JOIN store b ON a.s_id=b.s_id";
		shshowinform = new MemInformServiceImp().normalfinad(pldsh);
		// *****
		// 1.会员数量
		int shshoenum = 0;
		// 2,总的余额（5）
		int shshoeyue = 0;
		// 3.总的积分
		int shshoejifen = 0;
		if (shshowinform != null && shshowinform.size() != 0) {
			shshoenum = shshowinform.size();

			for (Object[] obj : shshowinform) {
				shshoeyue = shshoeyue + Integer.parseInt(obj[5].toString());
				shshoejifen = shshoejifen + Integer.parseInt(obj[6].toString());
			}
		}
		int totalPage = 0;
		if (shshoenum % 10 == 0) {
			totalPage = shshoenum / 10;

		} else {

			totalPage = shshoenum / 10 + 1;
		}
		// 获取页面结束
		if ("first".equals(which)) {
			nowpage = 1;
		} else if ("next".equals(which)) {

			nowpage = pageno + 1;
		} else if ("prev".equals(which)) {
			nowpage = pageno - 1;

		} else if ("last".equals(which)) {

			nowpage = totalPage;
		} else {

			nowpage = Integer.parseInt(which);
		}

		// 开始进行新的查询（这里一定要和初始化的时候进行对应）
		int currenys = 10 * (nowpage - 1);
		String ksql = "select a.v_id,a.v_card_no,a.vip_name,a.vip_tel,a.v_level,a.v_balance,a.v_commodity_integral,b.s_name,a.vip_startdate, a.v_status FROM vip a LEFT JOIN store b ON a.s_id=b.s_id limit "
				+ currenys + ",10";
		List<Object[]> nlist = new MemInformServiceImp().normalfinad(ksql);
		request.setAttribute("totalPage", shshoenum);
		request.setAttribute("currentPage", nowpage);
		request.setAttribute("nlist", nlist);
		request.setAttribute("shshoenum", shshoenum);
		request.setAttribute("shshoeyue", shshoeyue);
		request.setAttribute("shshoejifen", shshoejifen);
		request.getRequestDispatcher("/pages/member/shmtable.jsp").forward(request, response);

	}

}
