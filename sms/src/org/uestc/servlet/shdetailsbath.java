package org.uestc.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.uestc.serviceImp.MemInformServiceImp;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class shdetailsbath
 */
@WebServlet(urlPatterns="/shdetailsbath",name="shdetailsbathServlet")
public class shdetailsbath extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type").toString();
		
		if(type.equals("init"))
		{
			this.detail_init(request, response);
		}
		
	}
	//编写私有方法
	
	private void detail_init(HttpServletRequest rq,HttpServletResponse rs) throws ServletException, IOException
	{
		String shopname=rq.getParameter("shopname").toString();
		String sh_stime=rq.getParameter("sh_stime").toString();
		String sh_etime=rq.getParameter("sh_etime").toString();
		String sh_fangshi=rq.getParameter("sh_fangshi").toString();
		try {
			sh_stime=StrToDate(sh_stime);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			sh_etime=StrToDate(sh_etime);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//查询并返回数据
		//1.获取充值门店id
		String sqle="select s_id from store where s_name="+"'"+shopname+"'";
		List<Object[]> listppp=new MemInformServiceImp().normalfinad(sqle);
		int storeid=0;
		if(listppp!=null&&listppp.size()!=0)
		{
			Object[] obj=listppp.get(0);
			storeid=Integer.parseInt(obj[0].toString());
 		}
		//2.进行列表的查询.要到前段再查询一次才可以显示
		String skjsql="select a.store_id,a.v_card_no,a.vtype,a.v_payin_off,a.v_giving,a.saler_id,a.v_date,b.emp_name from vip_consume_log a left join employee b on a.saler_id=b.emp_id where vtype="+sh_fangshi+" and a.store_id="+storeid+" and v_date>="+"'"+sh_stime+"'"+" and v_date<="+"'"+sh_etime+"'"+" limit 0,10";
		List<Object[]> detailslist=new MemInformServiceImp().normalfinad(skjsql);
		String ssslll="select a.store_id,a.v_card_no,a.vtype,a.v_payin_off,a.v_giving,a.saler_id,a.v_date,b.emp_name from vip_consume_log a left join employee b on a.saler_id=b.emp_id where vtype="+sh_fangshi+" and a.store_id="+storeid+" and v_date>="+"'"+sh_stime+"'"+" and v_date<="+"'"+sh_etime+"'";
		List<Object[]> lastdetails=new MemInformServiceImp().normalfinad(ssslll);
		int currentPage=1;
		int totalPage=lastdetails.size();
		rq.setAttribute("totalPage", totalPage);
		rq.setAttribute("currentPage", currentPage);
		rq.setAttribute("detailslist", detailslist);
		rq.getRequestDispatcher("/pages/member/shmoneydetailsbath.jsp").forward(rq, rs);
		
	}
	//编写字符串转化为毫秒级
	private String StrToDate(String str) throws java.text.ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "" + date.getTime();
	}
	

}
