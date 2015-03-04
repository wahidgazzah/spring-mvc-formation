<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
		<div style="margin:30px 10px 0;">
			<div class="about-title">
				<h3>About this project</h3>
			</div>
			<p>	
				This project developed By <a href="http://blog.dihaw.com" target="_blank">Wahid Gazzah</a>. 
				The source code is available in <a href="https://github.com/wahidgazzah/spring-mvc-formation" target="_blank">Github</a>.
			</p>
			
			<div class="about-title">
				<h3>Technology used</h3>
			</div>
			<ul>
				<li><strong style="color: #f78b0e">Spring MVC</strong></li>
				<li><strong style="color: #f78b0e">Maven</strong></li>
				<li><strong style="color: #f78b0e">JPA</strong></li>
				<li><strong style="color: #f78b0e">Spring Data</strong>: used for the list pagination ( size, page, oderBy)</li>
				<li><strong style="color: #f78b0e">Tiles</strong>: in order to create the template (header, body, menu, footer)</li>
				<li><strong style="color: #f78b0e">Ehcache</strong>: in order to optimize the database access and the cache of the application</li>
				<li><strong style="color: #f78b0e">logback</strong>: <a href="http://logback.qos.ch/" target="_blank">Logback</a> is intended as a successor to the popular log4j project, <a href="http://logback.qos.ch/reasonsToSwitch.html" target="_blank">picking up where log4j leaves off</a></li>
			</ul>
			</br></br> 
			<div class="about-title">
				<h3>Data Base</h3>
			</div>
			<ul>
				<li>Create a <strong>userdb</strong> mysql database within <strong>wamp</strong> server application</li>
				<li>Import the <strong>database-script.sql</strong> in your <strong>userdb</strong> database</li>
			</ul>
			</br></br> 
			<div class="about-title">
				<h3>Import the Git project using STS IDE</h3>
			</div>
			<ul>
				<li>Go to the File menu and choose Import.</li>
				<li>Surf in the Import menu to Git and select Projects from Git.</li>
				<li>Choose URI at this point...</li>
				<li>After import, click the right mouse button on your project, Configure -> Convert to Maven Project.</li>
				<li>To run the project, use "clean compile install" cmd.</li>
				<li>Go to http://localhost:port/spring-mvc-formation/</li>
				<li>The <strong>log</strong> will be created on the <em>C:/wahidgazzah/logs/spring-mvc-formation/application.log</em> file (see the <strong>logback.xml</strong> file)</li>
			</ul>
			</br></br>  
		</div>
    </tiles:putAttribute>
</tiles:insertDefinition>