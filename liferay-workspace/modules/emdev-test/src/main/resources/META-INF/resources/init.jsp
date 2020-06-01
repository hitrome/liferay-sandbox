<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<%@ page import="com.liferay.portal.kernel.service.UserLocalService" %>
<%@ page import="com.liferay.portal.kernel.service.CompanyLocalService" %>
<%@ page import="com.liferay.portal.kernel.model.User" %>
<%@ page import="com.liferay.portal.kernel.model.Organization" %>
<%@ page import="com.liferay.portal.kernel.model.Phone" %>

<%@ page import="com.liferay.portal.kernel.model.Company" %>
<%@ page import="com.liferay.portal.kernel.service.permission.UserPermission" %>
<%@ page import="com.liferay.portal.kernel.security.permission.ActionKeys" %>
<%@ page import="com.liferay.portal.kernel.util.PropsKeys" %>
<%@ page import="com.liferay.portal.kernel.util.PropsUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.language.LanguageUtil" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %>
<%@ page import="com.liferay.petra.string.StringPool" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<liferay-theme:defineObjects />

<portlet:defineObjects />

<%
UserLocalService userLocalService = (UserLocalService) renderRequest.getAttribute(UserLocalService.class.getName());
CompanyLocalService companyLocalService = (CompanyLocalService) renderRequest.getAttribute(CompanyLocalService.class.getName());
UserPermission userPermission = (UserPermission) renderRequest.getAttribute(UserPermission.class.getName());
SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy", locale);
%>