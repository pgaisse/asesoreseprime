const { json } = require("express");
const pdf = require('html-pdf');
const path = require('path');
const fs = require('fs')
const puppeteer = require('puppeteer');
const util = require('util')
const htmlToXlsx = require('html-to-xlsx')
const chromeEval = require('chrome-page-eval')({ puppeteer })
const writeFileAsync = util.promisify(fs.writeFile)
const uuid = require('uuid');
const unicid = uuid.v4();
const conversionFactory = require('html-to-xlsx')


async function createExcel(data, dataBody) {
    const body = await bodybuilder(data, dataBody);
    const tmpHtmlPath = path.join(__dirname, 'input.html')
    const conversion = conversionFactory({
        extract: async ({ html, ...restOptions }) => {

            await writeFileAsync(tmpHtmlPath, html)

            const result = await chromeEval({
                ...restOptions,
                html: tmpHtmlPath,
                scriptFn: conversionFactory.getScriptFn()
            })

            const tables = Array.isArray(result) ? result : [result]

            return tables.map((table) => ({
                name: table.name,
                getRows: async (rowCb) => {
                    table.rows.forEach((row) => {
                        rowCb(row)
                    })
                },
                rowsCount: table.rows.length
            }))
        }
    })

    try {
        const stream = await conversion(body)
        stream.pipe(fs.createWriteStream(path.join(__dirname, '../public/uploads/XLS/' + unicid + '.xlsx')));
        console.log('El archivo XLSX fue creado exitosamente.');
    } catch (error) {
        console.error('Error al convertir HTML a XLSX:', error);
    }



}
async function reOrdenar(rowdamages) {
    rowdamages.forEach(damage => {
        const sectorName = damage.sector_name;
        if (!groupedData[sectorName]) {
            groupedData[sectorName] = [];
        }
        groupedData[sectorName].push(damage);
    });

    // Crea un nuevo array con los sectores y sus daños asociados
    const organizedData = Object.keys(groupedData).map(sectorName => {
        return {
            sector_name: sectorName,
            damages: groupedData[sectorName]
        };
    });
    return organizedData;
}
//<p><img src="data:image/jpeg;base64,${imageBase64}"  style="width:200px; height: auto"alt="Una imagen"></p>
async function bodybuilder(data, dataBody) {
    const imageBase64 = imageToBase64(path.join(__dirname, '../public/style-1/img/logo_p.png'));
    html = `
        <!DOCTYPE html>
        <html>
        <head>
            <title>Documento PDF con Bootstrap</title>
            <!-- Bootstrap CSS via CDN -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        </head>
        <body>
        <style>
      html { -webkit-print-color-adjust: exact; }
</style>
<style>
  .precio {
    text-aling:left;
  }
  body{
    font-family: arial;
    font-size: 40px;
    text-align: justify
  }
  .precio::before {
    content: "$";
    color: black;
  }

</style>
<div style='text-align:center'>


</div>
        
        <div class="form-control" style='width:100%; border: 1px solid black;'>
            <div class="col">
           
            <table class="table" style="border: none; font-size: 12px">
            <tr><td colspan="2" style="text-align:center"><h3><b>Presupuesto de Reparaciones</b></h3></td></tr>
            <tr><td style="border: none"><b>Nombre:</b> ${data[0].client_name} ${data[0].client_lastname}</td><td style="border: none"><b>Rut:</b> ${data[0].client_rut}</td></tr>
            <tr><td style="border: none"><b>Dirección: </b> ${data[0].client_address}</td><td style="border: none"><b>Fono: </b>${data[0].client_phone}</td></tr>
            <tr><td style="border: none"><b>Siniestro: </b> ${data[0].incident_code} </td><td style="border: none"><b>Fecha Ppto:</b> fecha</td></tr>
            <tr><td style="border: none"><b>Email: </b>${data[0].client_email}</td><td style="border: none"><b>Nro. Ppto:</b> Numero pp</td></tr>
            </table>
            
            </div>
            

        </div>
<br/>
            <table class="table">
                <thead class="table-light">

                    <tr style="text-align:center; font-size: 15px;">
                        <th>Item</th>
                        <th>Partidas</th>
                        <th>Uni</th>
                        <th>Cantidad</th>
                        <th>P.Uni</th>
                        <th>Valor Total</th>
                    </tr>
                </thead>

                <tbody>
                <div >
                
                
                </div>
            `;
    let row = "";
    let i = 1;
    let j = 1;
 
    console.log(data);
    for (let sectorKey in dataBody) {
        row = row + `<tr><td colspan=6 style="text-align:left; text-transform: capitalize;"><h7><b>${dataBody[sectorKey].sector_name}</b></h7></td></tr>`
        dataBody[sectorKey].damage_repair.forEach(repair => {
            row = row + `<tr style="text-align:center;  font-size: 12px;">
                    <td>${j}.${i}</td><td style="text-align:left;">${repair.reparacion}</td><td>${repair.unit}</td><td>${repair.size}</td><td>${repair.precio}</td><td>${repair.precio * repair.size}</td>
                    
                    </tr>`
            i++;
        });
        i = 1;
        j++
    }
    //new Intl.NumberFormat("es-CL", { style: 'currency', currency: 'CLP' }
    let html2 = html + row + '</tbody></table></body></html>'
    return html2;
}
async function bodybuilder_pdf(data, dataBody) {
    const scriptStart=`<tr style='height:40px;'><td style='width:50%px;'><b>`
    const scriptMiddle= `</b></td> <td>: `
    const scriptEnd='</td></tr>'
    const route = "img_m/"
    const resG_w = 1920;
    const resG_h = 1080;
    const square = 300;
    const imagesize_w = square
    const imagesize_h=square*resG_h/resG_w;
    html = `
        <!DOCTYPE html>
        <html>
        <head>
            <title>Documento PDF con Bootstrap</title>
            <!-- Bootstrap CSS via CDN -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        </head>
        <body>
        <style>
      html { -webkit-print-color-adjust: exact; }
</style>
<style>
  .precio {
    text-aling:left;
  }
  .precio::before {
    content: "$";
    color: black;
  }
  body{
    font-family: arial;
    font-size: 14px;
    text-align: justify
  }
  .meniatura2{
    height: 150px;
    width: 200px;
  }
}

</style>
<div style='text-align:right; padding-right:20px; padding-bottom:20px'>
<img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/style-1/img/logo_p.png`)).toString('base64')}" width="30%" >

</div>
        <span align="center"style="text-align=center;text-decoration: underline;"><h2><b>Informe de Reparaciones</b></h2></span>
        <div  style='width:100%;'>
            <div class="row" style="padding-left:20px">
            
            
            <table class='table'">
            <tr><td colspan= 2 style="text-decoration: underline" ><h3>Datos del Asegurado</h3><td></tr>
            ${scriptStart}Nombre ${scriptMiddle} ${data[0].client_name} ${data[0].client_lastname}${scriptEnd}
            ${scriptStart}Rut ${scriptMiddle} ${data[0].client_rut}${scriptEnd}
            ${scriptStart}Dirección ${scriptMiddle} ${data[0].client_address}${scriptEnd}
            ${scriptStart}Ciudad ${scriptMiddle} ${data[0].client_city}${scriptEnd}
            ${scriptStart}Email ${scriptMiddle} ${data[0].client_email}${scriptEnd}
            ${scriptStart}Fono ${scriptMiddle} ${data[0].client_phone}${scriptEnd}
            </div>
            <div class="row" style="padding-left:20px">
            <tr><td colspan= 2 style="text-decoration: underline" ><h3>Antecedentes del Siniestro </h3><td></tr>
            ${scriptStart}Tipo de Siniestro ${scriptMiddle} ${data[0].incident_type} ${scriptEnd}
            ${scriptStart}Siniestro ${scriptMiddle} ${data[0].incident_code} ${scriptEnd}
            ${scriptStart}Fecha del Siniestro ${scriptMiddle} ${data[0].incident_date} ${scriptEnd}
            ${scriptStart}Intensidad ${scriptMiddle} ${data[0].incident_scale} ${scriptEnd}
            ${scriptStart}Información adicional ${scriptMiddle} ${data[0].incident_description} ${scriptEnd}
            <tr><td colspan= 2 style="text-decoration: underline" ><h3>Fotos Fachada </h3><td></tr>
            <tr> <td> <img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + data[0].case_img1)).toString('base64')}"  width=${imagesize_w} height=${imagesize_h}">  </td>
            <td> <img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + data[0].case_img2)).toString('base64')}"  width=${imagesize_w} height=${imagesize_h}">  </td>
            </tr>
        

            </table>
            
            </div>
            

        </div>
        <table class="table" style="border: none; font-size: 12px">
        `
    let row = "";
    let i = 1;
    let j = 1;

    for (let sectorKey in dataBody) {
        let imgs1;
        let imgs2;
        let imgs1_1;
        let imgs2_1;

    

        imgs1 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + dataBody[sectorKey].damages[0].img1));
        imgs2 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + dataBody[sectorKey].damages[0].img2));
        imgs1_1 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + dataBody[sectorKey].damages[0].img1_1));
        imgs2_1 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + dataBody[sectorKey].damages[0].img2_1));


        row = row + `<tbody><tr>
            <td colspan=8 style="text-align:left; text-transform: capitalize;"><h3><b>${j}. ${dataBody[sectorKey].sector_name}</b></h3></td></tr>
            <tr><td colspan=4 style='text-align:left'>`
        if (imgs1) {
            row = row + `<img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + dataBody[sectorKey].damages[0].img1)).toString('base64')}" width=${imagesize_w} height=${imagesize_h}>`
        }
        row = row + "</td><td colspan=4>"
        if (imgs2) {
            row = row +`<img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + dataBody[sectorKey].damages[0].img2)).toString('base64')}" width=${imagesize_w} height=${imagesize_h}>`
        }
        row = row + `</td></tr>`
        dataBody[sectorKey].damages.forEach(repair => {

            imgd1 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + repair.damage_image1));
            imgd2 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + repair.damage_image2));
            imgd3 = imageToBase64(path.join(__dirname, `../public/uploads/images/${route}` + repair.damage_image3));

            row = row + `
                <tr style="text-align:center;  font-size: 12px;">
                    <td style="text-align:center;" colspan=8><h3><span style="text-transform: capitalize">${j}.${i} ${repair.damage_name} </span>(${repair.damage_size} ${repair.damage_unit})</h3></td>
                </tr>
                <td colspan=4 style='text-align:left'>`
            if (imgd1) {
                row = row + `<img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + repair.damage_image1)).toString('base64')}"  width=${imagesize_w} height=${imagesize_h}">`    
            }
            row = row + "</td> <td colspan=4 style='text-align:left'>"
            if (imgd2) {
                row = row + `<img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + repair.damage_image2)).toString('base64')}"  width=${imagesize_w} height=${imagesize_h}">`
            }
            row = row + `</td></tr>
            <tr><td colspan=8 style='text-align:left'> `
            
            if (imgd3) {
                row = row + `<img src="data:image/jpeg;base64,${fs.readFileSync(path.join(__dirname, `../public/uploads/images/${route}` + repair.damage_image3)).toString('base64')}"  width=${imagesize_w} height=${imagesize_h}">`
            }
            row = row + '</td></tr>';



            i++;
        });
        i = 1;
        j++
    }
    let html2 = html + row + `</tbody></table></body></html>`

    return html2;
}

async function buildPDF(data, dataBody) {
    const ruta = path.join(__dirname, '../public/style-1/img/logo_p.png');

    const html2 = await bodybuilder_pdf(data, dataBody);
    //console.log(html2)
    // Crea el PDF
    const browser = await puppeteer.launch({ headless: 'new', args: ['--allow-file-access-from-files', '--enable-local-file-accesses'] });
    const page = await browser.newPage();
    await page.setContent(html2,{ waitUntil: 'domcontentloaded' });
    
    const unicid = uuid.v4();
    const namepdf = unicid + '.pdf';
    // Configura opciones para el PDF
    const pdfOptions = {
        margin: {              // Añade márgenes al documento
            top: '20mm',
            right: '20mm',
            bottom: '20mm',
            left: '20mm'
        },
        path: path.join(__dirname, '../public/uploads/PDF/' + namepdf), // El nombre de archivo del PDF
        format: 'A4',          // El tamaño del papel
        printBackground: true  // Asegura que los estilos de fondo se impriman
    };

    // Genera el PDF
    const pdf = await page.pdf(pdfOptions);

    // Cierra el navegador
    await browser.close();
    const pdfbuffer=await page.goto(path.join(__dirname, '../public/uploads/PDF/' + namepdf), { waitUntil: 'networkidle0' });

    buildPDF().then(() => {
        console.log('PDF generado correctamente.');
      }).catch((err) => {
        console.error('Error al generar el PDF:', err);
      });

    return pdfbuffer;


}


function imageToBase64(path) {
    let file = "";

    if (fs.existsSync(path)) {
        console.log('File exists');
        return true
   
    }
    else {
        console.log('File doesnt exists');;
    }
    return false
}
async function reOrdenar(rowdamages) {
    const groupedData = {};
    rowdamages.forEach(damage => {
        const sectorName = damage.sector_name;
        if (!groupedData[sectorName]) {
            groupedData[sectorName] = [];
        }
        groupedData[sectorName].push(damage);
    });

    // Crea un nuevo array con los sectores y sus daños asociados
    const organizedData = Object.keys(groupedData).map(sectorName => {
        return {
            sector_name: sectorName,
            damages: groupedData[sectorName]
        };
    });
    return organizedData;
}

async function reOrdenar_3(rowdamages) {
    const groupedData = {};
    rowdamages.forEach(damage => {
        const sectorName = damage.sector_name;
        const sectorImg1 = damage.img1;
        const sectorImg2 = damage.img2;
        createKey(groupedData, sectorName, null, []);
        createKey(groupedData, "sector_img1", null, "sectorImg1");
        createKey(groupedData, "sector_img2", null, "sectorImg2");


        groupedData[sectorName].push(damage);
    });

    // Crea un nuevo array con los sectores y sus daños asociados
    const organizedData = Object.keys(groupedData).map(sectorName => {
        return {
            sector_name: sectorName,
            damages: groupedData[sectorName]
        };
    });
    return organizedData;
}

async function reOrdenar_v2(items) {
    let sectorName = null;
    let oldSectorName = null;
    const groupedData = {};
    items.forEach((item, index) => {
        let itemReducido = {};
        const sectorName = item.sector_name;
        const damageName = item.damage_name;
        const damageSize = item.damage_size;
        const caseImg1 = item.case_img1;
        const caseImg2 = item.case_img2;
        const sectorImg1 = item.img1;
        const sectorImg2 = item.img2;
        const img1d = item.damage_image1;
        const img2d = item.damage_image2;
        const img3d = item.damage_image3;

        createKey(groupedData, sectorName, null, {});
        createKey(groupedData, sectorName, 'sector_name', sectorName);
        createKey(groupedData, sectorName, 'case_img1', caseImg1);
        createKey(groupedData, sectorName, 'case_img2', caseImg2);
        createKey(groupedData, sectorName, 'sector_img1', sectorImg1);
        createKey(groupedData, sectorName, 'sector_img2', sectorImg2);
        createKey(groupedData, sectorName, 'damage_size', damageSize);
        createKey(groupedData, sectorName, 'damage_img1', img1d);
        createKey(groupedData, sectorName, 'damage_img2', img2d);
        createKey(groupedData, sectorName, 'damage_img3', img3d);
        createKey(groupedData, sectorName, 'damage_repair', []);

        if (index > 0) {
            oldSectorName = items[index - 1].sector_name
            itemReducido = {
                damage: damageName,
                size: damageSize,
                reparacion: item.repair_name,
                precio: item.repair_price,
                unit: item.repair_unit,
                id_case: item.id_case
            };
            groupedData[sectorName]['damage_repair'].push(itemReducido);
        }

        //console.log("oldsector  :" + oldSectorName + "      sector: " + sectorName)
        if (oldSectorName == sectorName) {
            itemReducido = {
                damage: damageName,
                size: damageSize,
                reparacion: item.repair_name,
                precio: item.repair_price,
                unit: item.repair_unit,
                id_case: item.id_case
            };
            groupedData[sectorName]['damage_repair'].push(itemReducido);

        }


    });


    //console.log(JSON.stringify(groupedData, null, 2))
    //console.log(JSON.stringify(groupedData, null, 2))

    // Crea un nuevo array con los sectores y sus daños asociados
    return groupedData;
}

function createKey(obj, key1, key2, value) {
    if (key2 == null) {
        if (!obj[key1]) {
            obj[key1] = value;
        }
    }
    else {
        if (!obj[key1][key2]) {
            obj[key1][key2] = value;
        }
    }
}

module.exports = { buildPDF, reOrdenar, reOrdenar_v2, createExcel, reOrdenar_3,bodybuilder_pdf };

