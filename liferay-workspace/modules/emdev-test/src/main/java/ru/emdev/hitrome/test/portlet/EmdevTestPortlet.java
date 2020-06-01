package ru.emdev.hitrome.test.portlet;

import ru.emdev.hitrome.test.constants.EmdevTestPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.service.CompanyLocalService;
import com.liferay.portal.kernel.service.UserLocalService;
import com.liferay.portal.kernel.service.permission.UserPermission;

import java.io.IOException;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

/**
 * @author Roman Novikov (rrl-software@mail.ru, http://hitrome.ru)
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=EmdevTest",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + EmdevTestPortletKeys.EMDEVTEST,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class EmdevTestPortlet extends MVCPortlet {
	
	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute(UserLocalService.class.getName(), _userLocalService);
		renderRequest.setAttribute(UserPermission.class.getName(), _userPermission);
		renderRequest.setAttribute(CompanyLocalService.class.getName(), _companyLocalService);
		
		super.render(renderRequest, renderResponse);
	}
	
	@Reference(unbind="-")
	protected void setUserLocalService(UserLocalService userLocalService) {
		_userLocalService = userLocalService;
	}
	
	@Reference(unbind="-")
	protected void setUserPermission(UserPermission userPermission) {
		_userPermission = userPermission;
	}
	
	@Reference(unbind="-")
	protected void setCompanyLocalService(CompanyLocalService companyLocalService) {
		_companyLocalService = companyLocalService;
	}
	
	private UserLocalService _userLocalService;
	private UserPermission _userPermission;
	private CompanyLocalService _companyLocalService;
}