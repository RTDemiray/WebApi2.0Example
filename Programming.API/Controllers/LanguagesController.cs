using Programming.API.Attributes;
using Programming.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace Programming.API.Controllers
{
    [APIAuthorize(Roles = "A")]
    public class LanguagesController : ApiController
    {
        LanguagesDAL languageDal = new LanguagesDAL(); //[NonAction] Actionı pasif yapar dışarıdan ulaşılamaz hale getirir.


        public IHttpActionResult GetSearchByName(string name)
        {
            return Ok("Name: " + User.Identity.Name);

            //var language = languageDal.GetAllLanguages().Where(x => x.Founder == name);
            //return Ok(language);
        }

        //[Route("ServisGetir")]
        [ResponseType(typeof(IEnumerable<Languages>))] //Methodun hangi tipde veri döndürdüğünü belirtiyoruz.
        public IHttpActionResult Get()
        {
            var language = languageDal.GetAllLanguages();
            return Ok(language);
        }

        [ResponseType(typeof(Languages))]
        public IHttpActionResult Get(int id)
        {

            var language = languageDal.GetLanguageById(id);
            if (language == null)
            {
                return NotFound();
            }
            return Ok(language);


        }

        [ResponseType(typeof(Languages))]
        public IHttpActionResult Post(Languages language)
        {
            if (ModelState.IsValid)
            {
                var createdLanguage = languageDal.CreateLanguage(language);
                return CreatedAtRoute("DefaultApi", new { id = createdLanguage.ID }, createdLanguage);
            }
            else
            {
                return BadRequest(ModelState);
            }

        }

        [ResponseType(typeof(Languages))]
        public IHttpActionResult Put(int id, Languages language)
        {
            //id'ye ait kayıt yok ise
            if (languageDal.IsThereAnyLanguage(id) == false)
            {
                return NotFound();
            }
            //language modeli doğrulanmadıysa(Validation hataları)
            else if (ModelState.IsValid == false)
            {
                return BadRequest(ModelState);
            }
            //güncelleme işlemi tamamlandı
            else
            {
                return Ok(languageDal.UpdateLanguage(id, language));
            }

        }

        public IHttpActionResult Delete(int id)
        {
            if (languageDal.IsThereAnyLanguage(id) == false)
            {
                return NotFound();
            }
            else
            {
                languageDal.DeleteLanguage(id);
                return StatusCode(HttpStatusCode.NoContent);
            }
        }
    }
}
