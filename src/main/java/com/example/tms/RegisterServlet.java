package com.example.tms;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.UserDao;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDao deo;

    public void init() {
        deo = new UserDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try
        {
//            Gson gson = new Gson();
//            String details = request.getParameter("details");
//            user = gson.fromJson(details, User.class);
            JsonObject data = JsonParser.parseString(request.getParameter("details")).getAsJsonObject();
            String name = data.get("name").getAsString();
            String username = data.get("uname").getAsString();
            String email = data.get("email").getAsString();
            String dob = data.get("dob").getAsString();
            String password = data.get("pass").getAsString();
            User user = new User(name,username,email,dob,password);
            deo.insertUser(user);
            PrintWriter out = response.getWriter();
            out.println("successfully added "+user.name+","+user.username+","+user.email+","+user.dob+","+user.password);
            //            response.sendRedirect(request.getContextPath()+"/index.jsp");

        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }

//    private  void  insertUser ( HttpServletRequest  request , HttpServletResponse  response )
//            throws SQLException, IOException {
//        String name = request . getParameter( " name " );
//        String email = request . getParameter( " email " );
//        String country = request . getParameter( " country ");
//        User newUser =  new  User (name, email, country);
//    }

}

