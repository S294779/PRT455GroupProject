using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(helloworld.Startup))]
namespace helloworld
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
