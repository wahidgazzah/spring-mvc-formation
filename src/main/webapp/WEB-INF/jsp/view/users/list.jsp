<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
	    <div style="padding: 60px 10px 0;">
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
			
			<div class="section">
				<ul>
					<li class="section-head-30-left"><spring:message code="email" /></li>
					<li class="section-head-30"><spring:message code="lastconnection" /></li>
					<li class="section-head-10"><spring:message code="action" /></li>
					<li class="section-head-10"><spring:message code="edit" /></li>
					<li class="section-head-10"><spring:message code="delete" /></li>
					<li class="section-head-10-right"><spring:message code="notification" /></li>	
				</ul>	
				<c:forEach var="user" items="${result.content}" >
					<ul class="section-body">
						<li class="section-body-30">${user.email}</li>
						
						<li class="section-body-30">${user.lastConnection}</li>
						
						<li class="section-body-10">
							<c:if test="${user.status eq 'Enabled'}">
								<a href="changeStatus?id=${user.id}&status=${user.status}" >
									<img class="action-red" src='<c:url value="/static/images/action/action.png" />'>
								</a>
							</c:if>
							<c:if test="${user.status eq 'Disabled'}">
								<a href="changeStatus?id=${user.id}&status=${user.status}" >
									<img class="action-green" src='<c:url value="/static/images/action/action.png" />'>
								</a>
							</c:if>
						</li>
						
						<li class="section-body-10">
							<a href="edit?id=${user.id}" >
								<img src="<c:url value="/static/images/action/edit-icon.png" />" style="max-height: 22px; margin-top: 20px;">
							</a>						
						</li>
						
						<li class="section-body-10">
							<a id="${stat.index}" href="#delete" class="sets" onclick="switchDetails(${user.id})">
								<img src="<c:url value="/static/images/action/delete-icon.png" />" style="max-height: 22px; margin-top: 20px;">
							</a>						
						</li>
						
						<li class="section-body-10">
							<c:set var="cuont" value="${3 - (user.accountNonExpired + user.accountNonLocked + user.credentialsNonExpired)} "></c:set>
							<div class="badge">${cuont}</div>
						</li>
						
					</ul>
				</c:forEach>
			</div>
					
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
