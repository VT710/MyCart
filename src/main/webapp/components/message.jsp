
<%
String message = (String) session.getAttribute("message");
if (message != null) {
	//prints
	//out.println(message);
%>
<div class="alert custom-bg alert-dismissible fade show mt-2 text-light"
	role="alert">
	<strong><%=message %> </strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>

<%
session.removeAttribute("message");
}
%>