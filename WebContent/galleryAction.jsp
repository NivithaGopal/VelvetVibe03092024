<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.GalleryDAO"%>
<%@ page import="bean.GalleryBean"%>
<%
    String image1 = request.getParameter("image1");
    String image2 = request.getParameter("image2");

    if (image1 != null && image2 != null) {
        GalleryBean gallery = new GalleryBean();
        gallery.setImage1(image1);
        gallery.setImage2(image2);
        
        GalleryDAO galleryDAO = new GalleryDAO();
        boolean isAdded = galleryDAO.addGallery(gallery);

        if (isAdded) {
            response.setContentType("text/html");
            out.println("<script type='text/javascript'>");
            out.println("alert('Gallery images added successfully!');");
            out.println("window.location.href = 'viewGallery.jsp';"); // Redirect to a relevant page
            out.println("</script>");
        } else {
            response.setContentType("text/html");
            out.println("<script type='text/javascript'>");
            out.println("alert('Failed to add gallery images.');");
            out.println("window.history.back();"); // Go back to the previous page
            out.println("</script>");
        }
    } else {
        response.setContentType("text/html");
        out.println("<script type='text/javascript'>");
        out.println("alert('Invalid form submission.');");
        out.println("window.history.back();"); // Go back to the previous page
        out.println("</script>");
    }
%>
