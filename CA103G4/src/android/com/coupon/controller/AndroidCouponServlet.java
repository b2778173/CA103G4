package android.com.coupon.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import android.com.coupon.model.*;
import android.com.couponhistory.model.CouponhistoryDAO;
import android.com.couponhistory.model.CouponhistoryDAO_interface;

public class AndroidCouponServlet extends HttpServlet {

	private final static String CONTENT_TYPE = "text/html; charset=UTF-8";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletContext context = getServletContext();
		CouponDAO_interface dao = new CouponDAO();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		BufferedReader br = req.getReader();
		StringBuilder jsonIn = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		System.out.println("input: " + jsonIn);
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();

		if("getCouponByCoupSn".equals(action)) {
			String coupSn = jsonObject.get("coupSn").getAsString();
			CouponVO coupon = dao.getOneCouponWithCoucat(coupSn);
			writeText(res, gson.toJson(coupon));
		}
		else {
			writeText(res, "");
		}

	}

	private void writeText(HttpServletResponse res, String outText) throws IOException {
		res.setContentType(CONTENT_TYPE);
		PrintWriter out = res.getWriter();
		out.print(outText);
		out.close();
		System.out.println("outText: " + outText);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
}
