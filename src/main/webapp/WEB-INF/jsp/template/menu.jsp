<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:url value="/" var="helloUrl" />
<spring:url value="/about" var="aboutUrl" />
<spring:url value="/persons/list" var="personListUrl"  />
<spring:url value="/users/list" var="userListUrl"  />

<%-- >c:set var="RacinePath" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/ --%>
 
<div class="menu">
	<ul>
		<li ${fn:contains(pageContext.request.requestURI, 'jsp/index') ? 'class="current"' : ''}>
			<a href="${aboutUrl}"><b><spring:message code="menu.about" /></b></a>
		</li>
		
		<li ${fn:contains(pageContext.request.requestURI, 'jsp/view/index') ? 'class="current"' : ''}>
			<a href="${helloUrl}"><b><spring:message code="menu.hello" /></b></a>
		</li>
		<li ${fn:contains(pageContext.request.requestURI, 'persons') ? 'class="current"' : ''}>
			<a href="${personListUrl}"><b><spring:message code="menu.persons" /></b></a>
		</li>
		<li ${fn:contains(pageContext.request.requestURI, 'users') ? 'class="current"' : ''}>
			<a href="${userListUrl}"><b><spring:message code="menu.users" /></b></a>
		</li>
	</ul>
</div>
