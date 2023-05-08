package com.example.tms;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
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
            User user = new User();
            user.name = data.get("name").getAsString();
            user.email = data.get("email").getAsString();
            user.dob = data.get("dob").getAsString();
            user.password = data.get("pass").getAsString();
            PrintWriter out = response.getWriter();
            out.println("successfully added "+user.name+","+user.email+","+user.dob+","+user.password);

        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }

}

