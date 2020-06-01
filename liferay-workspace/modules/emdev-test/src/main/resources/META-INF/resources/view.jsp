<%@ include file="./init.jsp" %>

<%
// To hide default user permission checker exception
Company defaultCompany = companyLocalService.getCompanyByMx(PropsUtil.get(PropsKeys.COMPANY_DEFAULT_WEB_ID));
%>

<liferay-ui:search-container
	total="<%= userLocalService.getUsersCount() %>"
	>
	<liferay-ui:search-container-results
		results="<%= userLocalService.getUsers(searchContainer.getStart(), searchContainer.getEnd()) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.portal.kernel.model.User"
		modelVar="aUser"
	>
		<%-- To hide default user permission checker exception --%>
		<c:if test="<%= aUser.getUserId() != userLocalService.getDefaultUserId(defaultCompany.getCompanyId())
		&& userPermission.contains(permissionChecker, aUser.getUserId(), ActionKeys.VIEW) %>">

			<liferay-ui:search-container-column-text property="userId" />

			<liferay-ui:search-container-column-text name="full-name">
				<portlet:renderURL var="userDetailsRenderURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
					<portlet:param name="mvcPath" value="/userdetails.jsp" />
					<portlet:param name="userId" value="<%=String.valueOf(aUser.getUserId()) %>"/>
				</portlet:renderURL>
				<a href="javascript://" onClick="<portlet:namespace />showUserDetails('<%= userDetailsRenderURL.toString() %>')" ><%=aUser.getFullName() %></a>
			</liferay-ui:search-container-column-text>
 
			<liferay-ui:search-container-column-text property="emailAddress" />

			<liferay-ui:search-container-column-text property="jobTitle" />

			<liferay-ui:search-container-column-text name="birthday" >
				<%= dateFormat.format(aUser.getBirthday()) %><liferay-ui:message key="text-year" />
			</liferay-ui:search-container-column-text>
			
			<liferay-ui:search-container-column-text name="telephones" >
				<table>
					<tbody>
						<%
						for (Phone phone:aUser.getPhones()) {
						%>
							<tr><td><%= phone.getNumber() %></td></tr>
						<%
						}
						%>
					</tbody>
				</table>
			</liferay-ui:search-container-column-text>
			
			<liferay-ui:search-container-column-text name="organizations" >
				<table>
					<tbody>
						<%
						for (Organization organization:aUser.getOrganizations()) {
						%>
							<tr><td><%= organization.getName() %></td></tr>
						<%
						}
						%>
					</tbody>
				</table>
			</liferay-ui:search-container-column-text>
		</c:if>

		
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace/>showUserDetails',
		function(url) {
			Liferay.Util.openWindow({
				dialog: {
					destroyOnHide: true,
					height: 600,
					resizable: false,
					width: 800,
					centered: true
				},
				dialogIframe: {
					bodyCssClass: 'dialog-with-footer task-dialog'
				},
				id: '<portlet:namespace />user-detail-dialog',
				title: '<liferay-ui:message key="user-details" />',
				uri: url
			});
		},
		['liferay-util']
	);
</aui:script>