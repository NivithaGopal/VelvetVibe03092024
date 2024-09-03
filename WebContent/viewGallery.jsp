<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.GalleryDAO" %>
<%@ page import="bean.GalleryBean" %>
<%@ page import="java.util.List" %> <!-- Ensure List is imported -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Gallery - VELVETVIBE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            color: #333;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 1200px;
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .gallery-image {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Gallery Images</h2>
        <div class="row">
            <%
                GalleryDAO galleryDAO = new GalleryDAO();
                List<GalleryBean> galleries = galleryDAO.getAllGalleries(); // Ensure this method is defined correctly
                if (galleries != null && !galleries.isEmpty()) {
                    for (GalleryBean gallery : galleries) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div>
                        <img src="<%= gallery.getImage1() %>/images/<%= gallery.getImage1() %>" class="card-img-top gallery-image" alt="Image 1">
                    </div>
                    <div>
                        <img src="<%= gallery.getImage2() %>/images/<%= gallery.getImage2() %>" class="card-img-top gallery-image" alt="Image 2">
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <p class="text-center">No gallery images available.</p>
            <%
                }
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
