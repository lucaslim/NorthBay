using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NorthBay.Framework.Database;

namespace NorthBay.Logic.ImageGallery
{
    public class ImageGalleryClass
    {
       
        public IQueryable<ImageClass> getgallery()
        {
            //create an insteance of the data context class called objGalleryImageDC
            NorthBayDataContext objGalleryImageDC = new NorthBayDataContext();
            //creating anonymous variable with value being instance of LINQ object
            var allgallery = objGalleryImageDC.ImageClasses.Select(x => x);
            //return IQueryable<product> for databound control to bind to
            return allgallery;
        }

        public IQueryable<ImageClass> GetGalleryByID(int _Id)
        {
            //create an insteance of the data context class called objGalleryImageDC
            NorthBayDataContext objGalleryImageDC = new NorthBayDataContext();
            var allgallery = objGalleryImageDC.ImageClasses.Where(x => x.ID == _Id).Select(x => x);
            return allgallery;
        }

        public bool commitInsert(string _imageFile, string _FileName)
        {
            //create an insteance of the data context class called objGalleryImageDC
            NorthBayDataContext objGalleryImageDC = new NorthBayDataContext();
            //to ensure all data will be disposed when finished
            using (objGalleryImageDC)
            {
                //create an instance of the table
                ImageClass objNewGalleryImage = new ImageClass();
                //set table column to new values being passed from *.aspx card_image
                //objNewCardImage.id = _id;
                objNewGalleryImage.FilePath = _imageFile;
                objNewGalleryImage.FileName = _FileName;
                //insert command
                objGalleryImageDC.ImageClasses.InsertOnSubmit(objNewGalleryImage);
                //commit insert against db
                objGalleryImageDC.SubmitChanges();
                return true;
            }
        }
        public bool commitUpdate(int _Id, string _FileName)
        //public bool commitUpdate(int _Id, string _imageFile, string _FileName)
        {
            //create an insteance of the data context class called objGalleryImageDC
            NorthBayDataContext objGalleryImageDC = new NorthBayDataContext();
            using (objGalleryImageDC)
            {
                var objUGallery = objGalleryImageDC.ImageClasses.Single(x => x.ID == _Id);
                objUGallery.ID = _Id;
                //objUGallery.FilePath = _imageFile;
                objUGallery.FileName = _FileName;
                //commit update against db
                objGalleryImageDC.SubmitChanges();

                return true;
            }
        }
        public bool commitDelete(int _Id)
        {
            //create an insteance of the data context class called objGalleryImageDC
            NorthBayDataContext objGalleryImageDC = new NorthBayDataContext();
            using (objGalleryImageDC)
            {
                var objDelGallery = objGalleryImageDC.ImageClasses.Single(x => x.ID == _Id);
                //delete command
                objGalleryImageDC.ImageClasses.DeleteOnSubmit(objDelGallery);
                //commit delete aginst  db
                objGalleryImageDC.SubmitChanges();
                return true;
            }
        }
    }
}
