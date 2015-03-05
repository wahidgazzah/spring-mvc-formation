<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
	    <div style="margin: 30px 10px 0;">
			<div class="title">
				<h3><spring:message code="user.list" /></h3>
			</div>
			
			<div class="pagination">
			    <ul>
			        <c:forEach var="i" begin="0" end="${result.totalPages -1}">
			            <c:url var="pageUrl" value="/users/list?page=${i}" />
			            <c:choose>
			                <c:when test="${i == result.number}">
			                    <li class="active"><a href="${pageUrl}"><c:out value="${i}" /></a></li>
			                </c:when>
			                <c:otherwise>
			                    <li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			    </ul>
			</div>
				
			<table  style="width: 90%" class="reference">
				<tr class="head">
					<th><spring:message code="userId" /></th>
					<th><spring:message code="firstName" /></th>
					<th><spring:message code="lastName" /></th>
					<th><spring:message code="gender" /></th>
					<th><spring:message code="city" /></th>
					<th><spring:message code="edit" /></th>
					<th><spring:message code="delete" /></th>
				</tr>
				<c:forEach var="user" items="${result.content}">
					<tr>
						<td>${user.userId}</td>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.gender}</td>
						<td>${user.city.cityName}</td>
						<td class="edit"><a href="edit?id=${user.userId}"><spring:message code="edit" /></a></td>
						<td class="delete"><a href="#delete" class="sets" onclick="switchDetails(${user.userId})"><spring:message code="delete" /></a></td>
					</tr>
				</c:forEach>
			</table>
				
			<div class="btn-div">
				<a href="add" class="btn"><spring:message code="add-new-user" /></a>
			</div>
	
		</div>
		
		<div id="dialog-container" style="display:none">
			<div class="details">
				<div class="details-container" >
					<h3><spring:message code="question" /></h3>
					<div style=" margin: 20px 0 15px;">
						<a id="deleteAction" href="delete?id=" class="btn"><spring:message code="yes" /></a>
						<a href="#" class="btn" onclick="closeDetails()"><spring:message code="cancel" /></a>
					</div>
				</div>
			</div>
		</div>
			
    </tiles:putAttribute>
</tiles:insertDefinition>
