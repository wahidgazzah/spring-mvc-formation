<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:url value="/" var="helloUrl" />
<spring:url value="/about" var="aboutUrl" />
<spring:url value="/persons/list" var="personListUrl"  />
<spring:url value="/users/list" var="userListUrl"  />
 
<div class="menu">
	<ul>
		<li><a href="${aboutUrl}"><spring:message code="menu.about" /></a></li>
		<li><a href="${helloUrl}"><spring:message code="menu.hello" /></a></li>
		<li><a href="${personListUrl}"><spring:message code="menu.persons" /></a></li>
		<li><a href="${userListUrl}"><spring:message code="menu.users" /></a></li>
	</ul>
</div>
