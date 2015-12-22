<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>Spitter</title>
<link href="<s:url value="/resources" />/css/spitter.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="container">
		<a href="<s:url value="/home" />"><img
			src="<s:url value="/resources" />/images/spitter_logo_50.png"
			border="0" /></a>

		<div>
			<h2>A global community of friends and strangers spitting out
				their inner-most and personal thoughts on the web for everyone else
				to see.</h2>
			<h3>Look at what these people are spitting right now...</h3>

			<ol class="spittle-list">
				<c:forEach var="spittle" items="${spittles}">

					<s:url value="/spitters/{spitterName}" var="spitter_url">
						<s:param name="spitterName" value="${spittle.spitter.username}" />
					</s:url>

					<li><span class="spittleListImage"> <img
							src="http://s3.amazonaws.com/spitterImages/${spittle.spitter.id}.jpg"
							width="48" border="0" align="middle"
							onError="this.src='<s:url value="/resources/images"/>/spitter_avatar.png';" />
					</span> <span class="spittleListText"> <a href="${spitter_url}"><c:out
									value="${spittle.spitter.username}" /></a> - <c:out
								value="${spittle.text}" /><br /> <small><fmt:formatDate
									value="${spittle.when}" pattern="hh:mma MMM d, yyyy" /></small>
					</span></li>
				</c:forEach>
			</ol>
		</div>
	</div>
</body>
</html>
