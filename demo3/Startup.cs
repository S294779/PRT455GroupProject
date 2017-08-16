using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(demo3.Startup))]
namespace demo3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
