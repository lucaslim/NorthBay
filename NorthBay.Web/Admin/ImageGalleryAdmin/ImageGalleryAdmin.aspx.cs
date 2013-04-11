using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Framework.Database;
using NorthBay.Logic.ImageGallery;
using System.IO;

namespace NorthBay.Web.Admin.ImageGalleryAdmin
{
    public partial class ImageGalleryAdmin : System.Web.UI.Page
    {
        ImageGalleryClass objImgGall = new ImageGalleryClass();
        int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            upDir = Path.Combine(Request.PhysicalApplicationPath, "Images/ImageGallery");

            if (!Page.IsPostBack)
            {
                _subRebind();

            }
        }

        protected void subAdmin(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Insert":
                    if (flag != 1)
                    {
                        //Creating object of LINQ Class
                        ImageGalleryClass objGallery = new ImageGalleryClass();

                        string serverPath = "~/Images/ImageGallery/".ToString();

                        string serverFileName = Path.GetFileName(Uploader.PostedFile.FileName);
                        string imageFile = serverPath + serverFileName.ToString();

                        objGallery.commitInsert(imageFile, txtFileNameI.Text);
                    }
                    else
                    {
                        flag = 0;
                    }
                    _subRebind();

                    break;

            }
        }

        private void _subRebind()
        {
            grid_img.DataSource = objImgGall.getgallery();
            grid_img.DataBind();
        }

        public string upDir;
        protected void cmdUpload_Click(object sender, EventArgs e)
        {
            // Check that a file is uploaded on server
            if (Uploader.PostedFile.FileName == "")
            {
                lblInfo.Text = "No file specified.";
            }
            else
            {


                // Check the extension.
                string extension = Path.GetExtension(Uploader.PostedFile.FileName);
                if (extension.ToLower().Equals(".bmp") || extension.ToLower().Equals(".png") || extension.ToLower().Equals(".gif") || extension.ToLower().Equals(".jpg"))
                {
                    //store image file in the current server application directory.
                    string serverFileName = Path.GetFileName(
                      Uploader.PostedFile.FileName);
                    string fullUploadPath = Path.Combine(upDir,
                      serverFileName);

                    try
                    {
                        // to verify if the file with same name exists or not. If it does, overwrite it
                        Uploader.PostedFile.SaveAs(fullUploadPath);

                        lblInfo.Text = "File " + serverFileName;
                        lblInfo.Text += " uploaded to ";
                        lblInfo.Text += fullUploadPath;

                    }
                    catch (Exception err)
                    {
                        lblInfo.Text = err.Message;
                    }
                }
                else
                {
                    flag = 1;
                    lblInfo.Text = "Note that only .bmp, .png, .jpg, & .gif file formats are allowed.";
                    return;
                }


            }
        }



        protected void DeleteImage(object sender, EventArgs e)
        {

            Button lnkDelete = (Button)sender;

            int _imgID = Int32.Parse(((Label)lnkDelete.FindControl("lblImageID")).Text);

            objImgGall.commitDelete(_imgID);

            _subRebind();

        }
        protected void EditImage(object sender, GridViewEditEventArgs e)
        {
            grid_img.EditIndex = e.NewEditIndex;
            _subRebind();
        }
        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grid_img.EditIndex = -1;
            _subRebind();
        }
        protected void UpdateImage(object sender, GridViewUpdateEventArgs e)
        {
            string ImgID = ((Label)grid_img.Rows[e.RowIndex].FindControl("lblImageID")).Text;
            int _imgID = int.Parse(ImgID);

            
            string Name = ((TextBox)grid_img.Rows[e.RowIndex].FindControl("txtFileName")).Text;
            
            objImgGall.commitUpdate(_imgID, Name);
            grid_img.DataSource = objImgGall.GetGalleryByID(_imgID);
            grid_img.DataBind();
            grid_img.EditIndex = -1;
            _subRebind();
        }
    }
}