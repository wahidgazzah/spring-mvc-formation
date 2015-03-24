<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="header">

	<a href="<spring:url value="/"></spring:url>">
		<div id="logo"></div>
	</a>
	
	<div id="home-title">
		<h3><spring:message code="application.name"/></h3>
	</div>
	<hr>	
</div>