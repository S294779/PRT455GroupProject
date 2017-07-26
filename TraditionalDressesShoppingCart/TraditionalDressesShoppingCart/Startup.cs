using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TraditionalDressesShoppingCart.Startup))]
namespace TraditionalDressesShoppingCart
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
