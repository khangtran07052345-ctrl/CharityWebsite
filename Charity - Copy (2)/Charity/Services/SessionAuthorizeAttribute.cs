
using System;
using System.Web;
using System.Web.Mvc;

namespace Charity.Security
{
    public class SessionAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session == null)
                return false;

            if (httpContext.Session["UserId"] == null)
                return false;

            string role = Convert.ToString(
                httpContext.Session["Role"]
            );

            if (string.IsNullOrEmpty(Roles))
                return true;

            string[] allowedRoles = Roles.Split(',');

            foreach (string allowedRole in allowedRoles)
            {
                if (role.Equals(
                    allowedRole.Trim(),
                    StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            return false;
        }

        protected override void HandleUnauthorizedRequest(
            AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Session["UserId"] == null)
            {
                filterContext.Result =
                    new RedirectToRouteResult(
                        new System.Web.Routing.RouteValueDictionary
                        {
                            { "controller", "Account" },
                            { "action", "Login" }
                        });
            }
            else
            {
                filterContext.Result =
                    new RedirectToRouteResult(
                        new System.Web.Routing.RouteValueDictionary
                        {
                            { "controller", "Home" },
                            { "action", "Index" }
                        });
            }
        }
    }
}
