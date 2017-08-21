using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ali.Startup))]
namespace ali
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
