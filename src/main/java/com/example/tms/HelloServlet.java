package com.example.tms;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import dao.UserDao;
import model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public static final int LOGIN=0,LOGOUT=1,GET_ALL_USERS=3;
    private UserDao op;
    public void init() {
        message = "Hello World!";
        op = new UserDao();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        int operation = Integer.parseInt(request.getParameter("operation"));
        HttpSession session = request.getSession();
        switch (operation)
        {
            case LOGIN:
                String username = request.getParameter("uname");
                String password = request.getParameter("pass");
                try
                {
                    User user = op.getUserByUsername(username, password);
                    String destPage = "login.jsp";
                    if(user != null)
                    {
                        session.setAttribute("user",user);
                        session.setMaxInactiveInterval(100);
                        destPage = "home.jsp";
                    }
                    else
                    {
                        message = "Invalid Username/Password";
                        request.setAttribute("message",message);
                    }
                    System.out.println(response);
                    RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
                    dispatcher.forward(request,response);
                } catch (Exception e)
                {
                    e.printStackTrace();
                }
                break;
            case LOGOUT:
                if (session != null)
                {
                    try {
                        session.removeAttribute("user");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                        dispatcher.forward(request,response);
                    } catch (ServletException e) {
                        throw new RuntimeException(e);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                break;
            case GET_ALL_USERS:
                if (session!=null)
                {
                    List<User> users = op.selectAllUsers();
                    try {
                        PrintWriter writer = response.getWriter();
                        Gson gson = new Gson();
                        JsonElement element = gson.toJsonTree(users, new TypeToken<List<User>>() {}.getType());

                        if (! element.isJsonArray() ) {
// fail appropriately
                            System.out.println("Exception");
                        }
                        JsonArray array = element.getAsJsonArray();
                        writer.println(array);
                        writer.close();
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }


                }
                break;
            default:
                PrintWriter writer = null;
                try {
                    writer = response.getWriter();
                    writer.println("Problem Occurred");
                    writer.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                break;
        }

    }

    public void destroy() {
    }
}
