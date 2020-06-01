<%@ include file="./init.jsp" %>

<%
long userId = ParamUtil.getLong(request, "userId");
User selectedUser = userLocalService.getUserById(userId);
List<String> emailesList = new ArrayList<>();
selectedUser.getEmailAddresses().forEach(a -> emailesList.add(a.getAddress()));
List<String> phones = new ArrayList<>();
selectedUser.getPhones().forEach(a -> phones.add(a.getNumber()));
List<String> organizations = new ArrayList<>();
selectedUser.getOrganizations().forEach(a -> organizations.add(a.getName()));
List<String> userAddresses = new ArrayList<>();
selectedUser.getAddresses().forEach(a -> userAddresses.add(a.getZip() + StringPool.COMMA_AND_SPACE + a.getCountry().getName()
		+ StringPool.COMMA_AND_SPACE + a.getCity() + StringPool.COMMA_AND_SPACE + a.getStreet1()));
%>
<div style="overflow: hidden;">
<img src="<%= selectedUser.getPortraitURL(themeDisplay) %>" width="200" style="float:left;" />
<div class="container">
	<div class="row">
		<div class="col"><liferay-ui:message key="userId"></liferay-ui:message><%= StringPool.COLON %></div>
		<div class="col"><%= String.valueOf(userId)%></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="user-screen-name" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getScreenName() %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="user-first-name" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getFirstName() %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="user-middle-name" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getMiddleName() %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="user-last-name" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getLastName() %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="full-name" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getFullName() %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="gender" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getFemale() ? LanguageUtil.get(request, "female") : LanguageUtil.get(request, "male") %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="birthday" /><%= StringPool.COLON %></div>
		<div class="col"><%= dateFormat.format(selectedUser.getBirthday()) %><liferay-ui:message key="text-year" /></div>
	</div>
</div>
</div>
<hr />
<div class="container">
	<div class="row">
		<div class="col"><liferay-ui:message key="jobTitle" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getJobTitle() %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="emailAddress" /><%= StringPool.COLON %></div>
		<div class="col"><%= selectedUser.getEmailAddress() %></div>
	</div>

	<div class="row">
		<div class="col"><liferay-ui:message key="more-emails" /><%= StringPool.COLON %></div>
		<div class="col"><%= String.join(StringPool.COMMA_AND_SPACE, emailesList) %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="telephones" /><%= StringPool.COLON %></div>
		<div class="col"><%= String.join(StringPool.COMMA_AND_SPACE, phones) %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="organizations" /><%= StringPool.COLON %></div>
		<div class="col"><%= String.join(StringPool.COMMA_AND_SPACE, organizations) %></div>
	</div>
	<div class="row">
		<div class="col"><liferay-ui:message key="addresses" /><%= StringPool.COLON %></div>
		<div class="col"><%= String.join(StringPool.COMMA_AND_SPACE, userAddresses)  %></div>
	</div>

</div>