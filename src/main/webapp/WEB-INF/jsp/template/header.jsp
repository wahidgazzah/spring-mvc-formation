<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="header">
	<div id="home-title">
		<a href="<spring:url value="/"></spring:url>">
			<h3><spring:message code="application.name"/></h3>
		</a>
	</div>
	<div class="user-area">
		<sec:authorize access="isAnonymous()">
			<div class="login"><a href="<spring:url value="/login"></spring:url>"><spring:message code="menu.login" /></a></div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div class="logout"><a href="<spring:url value="/logout"></spring:url>"><spring:message code="menu.logout" /></a></div>
		</sec:authorize>
	</div>
	<hr>
</div>
