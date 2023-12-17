<%@ page language="java" import="com.travelsphere.model.User" import="com.travelsphere.model.Cart" import="java.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
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
<title>travelsphere - Payment</title>
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

	<div
		class="d-flex h-auto pb-4 pt-4  justify-content-center item-center ">
		<div
			class="d-flex align-items-center py-4 bg-body-tertiary p-4 border shadow p-3 bg-body-tertiary rounded">





			<main class="form-signin p-4 ">

				<form action="userregistration" method="post">
					
					<h3 class=" mb-3 fw-normal">Make Payment
					</h3>
					<label
							for="floatingInput">Select Package Option</label>
<div class="form-floating my-2">
					
						<select>
						<option>
						3 Days
						</option>
						<option>
						7 Days
						</option>
						<option>
						1 Day
						</option>
						</select>
					</div>
					<div class="form-floating my-2">
						<input type="date" name="date" class="form-control"
							id="floatingInput" placeholder="name@example.com"> <label
							for="floatingInput">Date</label>
					</div><label
							for="floatingInput">Select Payment Option</label>
					<div class="form-floating my-2">
					
						<select>
						<option>
						Debit Card
						</option>
						<option>
						Credit Card
						</option>
						<option>
						Net Banking
						</option>
						</select>
					</div>



					
					<br>

					<a href="order-now?quantity=1&id=<%=id%>" class="btn btn-primary w-100 py-2 my-4 rounded-4"
						type="submit">Pay Now</a>

				</form>
			</main>

			
		</div>
	</div>

	<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>