const bcrypt = require('bcryptjs');
const sharp = require('sharp');
const fs = require('fs');
const path = require('path');
const uuid = require('uuid');

const helpers = {};

helpers.encryptPassword = async (password) => {
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  return hash;
};

helpers.matchPassword = async (password, savedPassword) => {
  try {
    return await bcrypt.compare(password, savedPassword);
  } catch (e) {
    console.log(e)
  }
};

helpers.resizeImage =  (files) => {
  try {
    const resG_w = 1920;
    const resG_h = 1080;
    const ResT = 300;
    const ResT_w = ResT;
    const ResT_h = Math.round(ResT_w * (resG_h / resG_w));
    const ResM = 400;
    const ResM_w = ResM;
    const ResM_h = Math.round(ResM_w * (resG_w / resG_w));
    let unicid  = "";
    const imageName = Object.keys(files).reduce((acc, key) => {
      acc[key] = null; // O el valor que desees
      return acc;
    }, {});


     Object.keys(files).forEach( fieldname => {
      unicid = uuid.v4();
      let name = unicid + ".png";
      imageName[fieldname] = name;
      files[fieldname].forEach(async file => {

        sharp(file.buffer).resize(resG_w, resG_h, { fit: 'cover' }).toBuffer().then((data) => {
          fs.writeFileSync(path.join(__dirname, `../public/uploads/images/img_w/${name}`), data)
        })
        .catch((err) => {
          console.error(`Error procesando la imagen: ${err.message}`);
        });

        sharp(file.buffer).resize(ResT_w, ResT_h, { fit: 'cover' }).toBuffer().then((data) => {
          fs.writeFileSync(path.join(__dirname, `../public/uploads/images/img_t/thumb_${name}`), data)
        })
        .catch((err) => {
          console.error(`Error procesando la imagen: ${err.message}`);
        });

        sharp(file.buffer).resize(ResM_w, ResM_h, { fit: 'cover' }).toBuffer().then((data) => {
          fs.writeFileSync(path.join(__dirname, `../public/uploads/images/img_m/${name}`), data)
        })
        .catch((err) => {
          console.error(`Error procesando la imagen: ${err.message}`);
        });


        //let buffer_w = sharp(buffer).resize(resG_w, resG_h, { fit: 'contain' }).toBuffer()
        

      });


    });
    
    //const result = helpers.checkFile(path.join(__dirname, `../public/uploads/images/img_t/thumb_${unicid+".png"}`))
    
      return imageName;
    

    // let unicid = uuid.v4();   


  }
  catch (e) {
    console.log("Error al guardar la imagen" + e)

  }



};

helpers.delFile = async (rows) => {
  console.log(rows);
  try {
    rows.forEach(row => {
      Object.entries(row).forEach(([key, value]) => {
        fs.unlinkSync(path.join(__dirname, `../public/uploads/images/img_w/${value}`));
        fs.unlinkSync(path.join(__dirname, `../public/uploads/images/img_t/thumb_${value}`));
        fs.unlinkSync(path.join(__dirname, `../public/uploads/images/img_m/${value}`));
      });
    });


    console.log('The File has been deleted successfully');

  }
  catch (e) {
    console.log('File no deleted' + e);

  }
}
helpers.checkFile= async(path)=>{

  const file=  fs.existsSync(path)
  if (file) {
    console.log('File exists', file+ "   "+path);
    return true
    
  }
  else {
    console.log('File doesnt exists', file+ "   "+path);
  }
  return false
}

module.exports = helpers;
