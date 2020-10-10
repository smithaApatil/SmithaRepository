package com.iiht.evaluation.coronokit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iiht.evaluation.coronokit.dao.ProductMasterDao;
import com.iiht.evaluation.coronokit.model.ProductMaster; 

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductMasterDao productMasterDao;
	
	@Override
	public void init() throws ServletException {
			prodService = new ProductServiceImple();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		String viewName="";
		
		switch(url) {
		
			case "/list":viewName = listAllProducts(request, response);break;
			case "/newProdForm":viewName=showNewProductForm(request, response);break;
			case "/addProd":viewName=insertProduct(request, response); break;
			case "/editProd":viewName=showEditProductForm(request, response);break;
			case "/updateProd":viewName=updateProduct(request, response);break;
			case "/deleteProd":viewName=deleteProduct(request, response);break;
			case "/admin":viewName="admin.jsp";break;
			case "/login":viewName=adminLogin(request, response);break;
			case "/logout":viewName=adminLogout(request, response);break;
		}
		
		request.getRequestDispatcher(viewName).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

	private String adminLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
          String view;
        try {
			HttpSession session=request.getSession();  
			session.removeAttribute("message");
	        session.invalidate();  
	        request.setAttribute("msg", "You have successfully logged out as admin");
	        view = "index.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errMsg", e.getMessage());
			view="errPage.jsp";
		} 
        
		return view;
	}
	
	private String adminLogin(HttpServletRequest request, HttpServletResponse response) {
		String uname = request.getParameter("loginid");
		String password = request.getParameter("password");
		String view = "";
		HttpSession session=request.getSession();  
		try {
			if (uname.contentEquals("admin") & password.contentEquals("admin")) {
				request.setAttribute("msg", "You have successfully logged in as admin");
				session.setAttribute("message","admin");
				ProductService prodService = new ProductServiceImple();
				List<Product> prods;
					prods = prodService.getAllProducts();
				
				request.setAttribute("prods", prods);
				view = "listproducts.jsp";
			} else
			{
				request.setAttribute("errMsg", "Incorrect cridentials provided. Please check your user name or password!!");
				session.setAttribute("message","xyzzz");
				view="errPage.jsp";
			}
		} catch (sba1Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return view;
		
		
	}
	
	private String listAllProducts(HttpServletRequest request, HttpServletResponse response) {
		String view = null;
		try {
			List<Product> prods = prodService.getAllProducts();
			request.setAttribute("prods", prods);
			view="listproducts.jsp";
		} catch (sba1Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			view="errPage.jsp";
		}
		return view;
	}
	
	private String updateProduct(HttpServletRequest request, HttpServletResponse response) {
			Product prod = new Product();
			
			prod.setId(Integer.parseInt(request.getParameter("id")));
			prod.setProductName(request.getParameter("prodName"));
			prod.setProductDescription(request.getParameter("prodDesc"));
			prod.setCost(Double.parseDouble(request.getParameter("prodCost")));
			
			String view="";
			try {
				prodService.ValidateAndSave(prod);
				request.setAttribute("msg", "Item Got Saved!");
				List<Product> prods = prodService.getAllProducts();
				request.setAttribute("prods", prods);
				view="listproducts.jsp";
				
			} catch (sba1Exception e) {
				request.setAttribute("errMsg", e.getMessage());
				view="errPage.jsp";
			}
			return view;
			
	}

	private String showEditProductForm(HttpServletRequest request, HttpServletResponse response) {
		String view="";
		int id = Integer.parseInt(request.getParameter("id"));
						
		try {
			Product prod = prodService.getProductByID(id);
			request.setAttribute("prod", prod);
			view="showNewProductForm.jsp";
		} catch (sba1Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			view="errPage.jsp";
		}
		return view;
	}

	private String deleteProduct(HttpServletRequest request, HttpServletResponse response) {
		String viewName ="deleteProduct.jsp";
		int id = Integer.parseInt(request.getParameter("id"));
			
			try {
				prodService.deleteProduct(id);
				request.setAttribute("msg", "Item Got Deleted!");
				List<Product> prods = prodService.getAllProducts();
				request.setAttribute("prods", prods);
				viewName="listproducts.jsp";
			} catch (sba1Exception e) {
				request.setAttribute("errMsg", e.getMessage());
				viewName="errPage.jsp";
			}
		
		
		return viewName;
	}

	private String insertProduct(HttpServletRequest request, HttpServletResponse response) {
		
		Product prod = new Product();
		prod.setId(Integer.parseInt(request.getParameter("id")));
		prod.setProductName(request.getParameter("prodName"));
		prod.setCost(Double.parseDouble(request.getParameter("prodCost")));
		prod.setProductDescription(request.getParameter("prodDesc"));
		
		String view="";
		try {
			prodService.ValidateAndAdd(prod);
			request.setAttribute("msg", "Item Got Added!");
			List<Product> prods = prodService.getAllProducts();
			request.setAttribute("prods", prods);
			view="listproducts.jsp";
		} catch (sba1Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			view="errPage.jsp";
		}
		return view;
		
	}

	private String showNewProductForm(HttpServletRequest request, HttpServletResponse response) {

		Product prod = new Product();
		request.setAttribute("prod", prod);
		
		return "showNewProductForm.jsp";
	}
}