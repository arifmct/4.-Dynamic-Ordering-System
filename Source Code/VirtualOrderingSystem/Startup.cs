using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VirtualOrderingSystem.Startup))]
namespace VirtualOrderingSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
