import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.util.*;
import java.text.*;


import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import java.util.*;
import java.io.*;


@WebServlet("/AutoComplete")

public class AutoComplete extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String query = request.getParameter("query");

    List<String> results = MySQLDataStoreUtilities.getSearch(query);

    StringBuilder json = new StringBuilder("[");
    for (int i = 0; i < results.size(); i++) {
        String[] resultParts = results.get(i).split(",");
        String name = resultParts[0];
        String id = resultParts[1];
        json.append("{\"name\":\"").append(name).append("\",\"id\":\"").append(id).append("\"}");

        if (i < results.size() - 1) {
            json.append(",");
        }
    }

    json.append("]");

    response.setContentType("application/json");
    response.getWriter().write(json.toString());
}
    
}
