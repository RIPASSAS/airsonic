<%
    String csv_string = request.getParameter("csv_data");
    String file_name = request.getParameter("file_name");
    if(file_name.length() == 0) file_name = "data.csv";

    response.setContentType("text/csv");
    response.setHeader("Content-Disposition", "attachment; filename="+file_name);

    PrintWriter outx = response.getWriter();
    outx.println(csv_string);
    outx.flush();
    outx.close();
%>