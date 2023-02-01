using Microsoft.AspNetCore.Mvc;
using System.Reflection;
using Young_Artists.Models;

namespace Young_Artists.Controllers
{
    public class AnnouncementController : Controller
    {
        public IActionResult List()
        {
            IEnumerable<Announcement> datas = null;
            YoungArtistsContext art = new YoungArtistsContext();
            datas = from t in art.Announcements
                    select t;
            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Announcement a)
        {
            YoungArtistsContext art = new YoungArtistsContext();
            art.Announcements.Add(a);
            art.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext art = new YoungArtistsContext();
                Announcement ann = art.Announcements.FirstOrDefault(t => t.Aid == id);
                if (ann != null)
                {
                    art.Announcements.Remove(ann);
                    art.SaveChanges();
                }
            }
            return RedirectToAction("List");
        }

        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                YoungArtistsContext art = new YoungArtistsContext();
                Announcement ann = art.Announcements.FirstOrDefault(t => t.Aid == id);
                if (ann != null)
                {
                    return View(ann);
                }
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(Announcement a)
        {
            YoungArtistsContext art = new YoungArtistsContext();
            Announcement ann = art.Announcements.FirstOrDefault(t => t.Aid == a.Aid);
            if (ann != null)
            {
                ann.AnnouncementType = a.AnnouncementType;
                ann.ContentTitle = a.ContentTitle;
                ann.ContentTime = a.ContentTime;
                ann.Content = a.Content;
                ann.DetailsId = a.DetailsId;
                art.SaveChangesAsync();
            }
            return View(ann);
        }
    }
}
