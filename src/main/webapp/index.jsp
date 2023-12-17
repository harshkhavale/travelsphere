<%@ page language="java" import="com.travelsphere.model.User"
	import="com.travelsphere.model.Cart" import="com.travelsphere.dao.ProductDao"
	import="com.travelsphere.model.Product" import="java.util.*"
	import="com.travelsphere.connection.DBCon"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DBCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {

	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Happy+Monkey&display=swap"
	rel="stylesheet">
<title>travelsphere</title>
<style>
body {
	font-family: 'Happy Monkey', sans-serif;
}
</style>

</head>
<body>

	<%@include file="includes/navbar.jsp"%>
	<div class="h-25" style="object-fit:'contain';height:'5px'">
	<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
    <img src="./assets/bg1.jpg" class="d-block w-100" style="height: 25rem; object-fit: cover;" alt="...">
</div>

    <div class="carousel-item ">
    <img src="./assets/bg2.jpg" class="d-block w-100" style="height: 25rem; object-fit: cover;" alt="...">
</div>
    <div class="carousel-item ">
    <img src="./assets/bg3.jpg" class="d-block w-100" style="height: 25rem; object-fit: cover;" alt="...">
</div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	</div>
	<div class="all-products p-4">
		<div class="d-flex item-center ">

			<h4>#Special Packages</h4>
			<img class="mx-2" alt="search" src="./assets/bookmark.png"
				style="height: 20px">

		</div>
		<div class="d-flex flex-wrap justify-content-center">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="card shadow-lg m-2 rounded-4 position-relative"
				style="width: 15rem; height: 25rem">
		 		<img src="./assets/<%=p.getImage()%>" class="h-50 card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title"><%=p.getName()%></h5>
					<p class="card-text"><%=p.getCategory()%></p>
					<h5 class="card-title"><%=p.getPrice()%></h5>
					<div
						class="d-flex justify-content-between position-absolute bottom-0 py-2 ">
						<a href="add-to-cart?id=<%=p.getId()%>" class="btn  rounded-4"><img
							alt="search" src="./assets/book.png" style="height: 25px"></a>
						<a href="payment.jsp?quantity=1&id=<%=p.getId()%>"
							class="btn btn-primary rounded-4">Book Now</a>
					</div>

				</div>
			</div>
			<%
			}
			}
			%>
		</div>

	</div>
	<%@include file="includes/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>