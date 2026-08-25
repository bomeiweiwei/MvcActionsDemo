using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MvcActionsDemo.Web.Models;

namespace MvcActionsDemo.Web.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        string name = "Test";

        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
