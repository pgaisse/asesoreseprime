const express = require('express');
const router = express.Router();
const {pool, exQuery} = require('../database');
const { isLoggedIn, isNLoggedIn, isAdmin } = require('../lib/auth');
const { log } = require('handlebars');
const sharp = require('sharp');
const pdfService = require('../lib/pdf');
const helpers = require('../lib/helpers');
const fs = require('fs')
const path = require('path');
const puppeteer = require('puppeteer');





router.get('/', async (req, res) => {
    try {
        const query = await exQuery("desc asesoresprime_web.6Scr5XN_clientes;")
        console.log("mierda de json", JSON.stringify(query, null, 2))
        //res.json(query);
        res.render('index')
    }
    catch (error) {
        res.render('index');
    }

});



router.get('/myinsp', isLoggedIn, async (req, res) => {
    try {
        const showCases = `
        SELECT
    (
        SELECT COUNT(DISTINCT cs2.id_sector)
        FROM c_d_s cs2
        WHERE cs2.id_case = cases.id_case
    ) AS nsectors,
    cases.id_case,
    cases.case_img1,
    cases.case_img2,
    cases.case_date,
    asesoresprime_web.6Scr5XN_clientes.nombre as client_name,
    asesoresprime_web.6Scr5XN_clientes.apellidos as client_lastname,
    asesoresprime_web.6Scr5XN_clientes.direccion as client_address,
    asesoresprime_web.6Scr5XN_clientes.rut as client_rut,
    status.status_name
FROM cases
INNER JOIN advisers ON advisers.id_adviser = cases.id_adviser
INNER JOIN status ON status.id_status = cases.id_status
INNER JOIN cases_clients ON cases_clients.id_case = cases.id_case

INNER JOIN asesoresprime_web.6Scr5XN_clientes ON asesoresprime_web.6Scr5XN_clientes.cliente_id = cases_clients.id_client
WHERE advisers.id_adviser = ${req.user.id_adviser}
GROUP BY 
    cases.id_case, 
    cases.case_img1, 
    cases.case_img2, 
    cases.case_date, 
    client_name, 
    client_lastname, 
    client_address, 
    client_rut, 
    status.status_name;`;
        console.log(showCases)
        if (req.query.case_img && req.query.id_case) {
            const qupdate = `update cases set ${req.query.case_img}=NULL WHERE id_case=${req.query.id_case}`
            await exQuery(qupdate);
            await helpers.delFile([image = { img: req.query.imageName }]);
            console.log(qupdate)
        }
        else {
            console.log(req.query.case_img + "   " + req.query.id_case)
        }

        const results = await exQuery(showCases);
        const queryCases = results;
       
        res.render('myinsp', { cases: queryCases });
    }
    catch (error) {

        req.flash('message', 'Ocurrió un error en la consulta ' + error);
        console.error('Error en la consulta:', error);
        res.redirect('myinsp');

    }
});

router.post('/myinsp', isLoggedIn, async (req, res) => {
    try {

        const imageNames = await helpers.resizeImage(req.files); 
        const query= `call delImgCase("${imageNames.image}","${imageNames.image1}",${req.body.id_case})`;
        console.log(query)
        await exQuery(query);
        req.flash('success', "Actualización de imagen exitosa.");
        res.redirect('myinsp');

    }
    catch (error) {
        const msg = "Ocurrió un error al actualizar las imagenes. ";
        req.flash('message', msg + error);
        console.error(msg, error);
        res.redirect('myinsp');
    }
});

router.post('/cases', isAdmin, async (req, res) => {
    try {
        const value = req.body.search_input;
        const column = req.body.search;
        const table = column;
        const table2 = table.split('_');
        let table3 = "";
        if (table.includes('id')) {
            table3 = table2[1];
            if (table3[table3.length - 1] !== 's') {
                table3 = table3 + 's';
            }
        }
        else {
            table3 = table2[0];
            if (table3[table3.length - 1] !== 's') {
                table3 = table3 + 's';
            }

        }

        res.redirect(`/cases?table=${table3}&column=${column}&value=${value}`);
    }
    catch (error) {
        req.flash('message', 'Ocurrió un error en la búsqueda');
        console.log(error)
        res.redirect('cases')

    }

});



router.get('/cases', isAdmin, async (req, res) => {
    try {
        const tablef = req.query.table;
        const column = req.query.column;
        const value = req.query.value;
        let sql = "";
        const statusColumns = "Select status.status_name from status;";
        if (!tablef?.trim() || !column?.trim() || !value?.trim()) {
            sql = `call showAllCases("cases","id_case",'>',"0")`;
        }
        else {

            sql = `call showAllCases("${tablef}","${column}",'=',"${value}")`;
        }
        const queryClients = "Select cliente_id id_client,numero_caso, nombre client_name, apellidos client_lastname, direccion client_address, tipo_siniestros indicent_type from asesoresprime_web.6Scr5XN_clientes where numero_caso >0  order by cliente_id ASC limit 10";
        const resultsClients = await exQuery(queryClients);


        const [results] = await exQuery(sql);
        campos_en = Object.keys(results[0]);
        // this array must update each time that query is modify
        campos_sp = ['N° de caso', 'Estado de caso', 'Fecha de caso', 'N° asesor', 'Nombre de asesor', 'Apellido de asesor', 'Código de siniestro', 'Nombre de cliente', 'Apellido de cliente', 'Rut de cliente', 'Dirección del cliente'];
        //campos                  =   campos_sp.concat(campos_en);
        showAllCases = results;

        const statusResults = await exQuery(statusColumns);

        const campos = campos_sp.map((elem, index) => {
            return { campos_sp: elem, campos_en: campos_en[index] };
        });

        res.render('cases', { cases: showAllCases, campos, statusFields: statusResults, resultsClients });
    }
    catch (error) {
        console.log(error)
        req.flash('message', 'Ocurrió un error en casos');
        res.redirect('cases')

    }

});

router.get('/addCase', isAdmin, async (req, res) => {
    try {
        const id_client = req.query.id_client;
        const ts = req.query.ts;
        const query= `call addCase(${id_client},"${ts[0]}")`
        console.log(query)
        await exQuery(query)
        res.redirect('/cases')
    }
    catch (err) {
        console.log("Error al ejecutar la consulta", err)

    }

})

router.get('/registers', isAdmin, async (req, res) => {
    try {
        const sql = `SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
        const tables = await exQuery(sql);
        tableName = 'advisers';
        const desctable = await exQuery(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
        const table = await exQuery(`SELECT * from ${tableName}`);
        res.render('registers', { tables, table, desc: desctable, tableName });

    }
    catch (error) {
        req.flash('message', 'Ocurrió un error');
        console.log(error)
        res.redirect('/')
    }

})


router.post('/registers', isAdmin, async (req, res) => {
    try {
        const sql = `SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME NOT LIKE '%\\_%' AND TABLE_NAME NOT IN ('budgets','sessions')`;
        const tables = await exQuery(sql);
        tableName = req.body.table_name;
        const desctable = await exQuery(`SELECT COLUMN_NAME, SUBSTRING_INDEX(COLUMN_NAME, '_', -1) AS nombreColumn FROM information_schema.columns WHERE TABLE_SCHEMA = 'cub' AND TABLE_NAME = '${tableName}'  ORDER BY ORDINAL_POSITION`);
        const table = await exQuery(`SELECT * from ${tableName}`);
        res.render('registers', { tables, table, desc: desctable, tableName })
    }
    catch (error) {
        console.log(error)
        res.redirect('/')
    }
})



router.get('/edit', isLoggedIn, async (req, res) => {
    try {


        res.render('edit/index');
    }
    catch (error) {
        console.log(error);

    }


});

router.get('/sectors', isLoggedIn, async (req, res) => {
    try {
        let action_repairs;
        let rowSectors = '';
        let querySelect = "";
        let string = "";
        let vcase = req.query.id_case;

        const showSectors = `call showSectors(${req.user.id_adviser},${req.query.id_case})`;



        const [results] = await exQuery(showSectors);

        const resultsSectors = results;
        action_repairs = resultsSectors;
        if (resultsSectors[0]['id_sector'] !== null) {
            querySelect = `SELECT id_sector, sector_name FROM sectors WHERE id_sector <> ${resultsSectors[0]['id_sector']}`;
            for (let i = 1; i < resultsSectors.length; i++) {
                string = string + " and id_sector <> " + resultsSectors[i]['id_sector'];
            }
            querySelect = querySelect + string + ";";
        }
        else {
            querySelect = `SELECT id_sector, sector_name FROM sectors;`;
        }



        console.log(querySelect);
        rowSectors = await exQuery(querySelect);
        const clientAddress = action_repairs[0]['client_address'] ? action_repairs[0]['client_address'] : "N/A";
        const clientName = action_repairs[0]['client_name'] ? action_repairs[0]['client_name'] : "N/A";
        const clientLastName = action_repairs[0]['client_lastname'] ? action_repairs[0]['client_lastname'] : "N/A";



        res.render('sectors/index', { action_repairs, rowSectors, vcase, client_data: { vaddress: clientAddress, vname: clientName, vlastname: clientLastName } });


    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al ingresar al caso');
        res.redirect(`/myinsp`)

    }


});



router.post('/sectors', isLoggedIn, async (req, res) => {
    // (select count(id_damage) from c_d_s where id_case=cs.id_case and id_sector=cs.id_sector) as ndamages 
    try {

        const imageNames = await helpers.resizeImage(req.files);
        const queryInsert1 = `insert into c_d_s (id_sector, id_case) values (${req.body.id_sector} ,${req.body.id_case});`;
        const queryInsert2 = `insert into dimentions (id_case, id_sector, sector_w_size, sector_l_size, sector_h_size, img1, img2)
                                    values (${req.body.id_case}, ${req.body.id_sector}, ${req.body.sector_w_size},${req.body.sector_l_size},${req.body.sector_h_size},"${imageNames.image}", "${imageNames.image1}")`;
        await exQuery(queryInsert1);
        await exQuery(queryInsert2);
        const [getl_id] = await exQuery("SELECT max(id_c_d_s) m_id from c_d_s");

        req.flash('success', 'Recinto agregado satisfactoriamente');
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}&id_c_d_s=${getl_id['m_id']}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al ingresar un sector ' + error);
        res.redirect(`sectors?id_case=${req.body.id_case}`);

    }


});


router.get('/damages', isLoggedIn, async (req, res) => {
    try {
        const id_case = req.query.id_case;
        const id_sector = req.query.id_sector;
        const id_c_d_s = req.query.id_c_d_s;
        const id_adviser = req.user.id_adviser;
        sql1 = "Select damage_name, damage_unit, id_damage from damages";
        sql3 = "Select damage_unit from damages group by damage_unit";
        sql4 = "Select id_repair, repair_name, repair_unit,  repair_price from repairs";
        let sql2 = `call queryDamages(${id_sector},${id_adviser},${id_case});`;
        const vcase = id_case;
        [results1] = await exQuery(`Select sector_name from sectors where id_sector=${id_sector}`);
        sector_name = results1;
        const defaultDamages = await exQuery(sql1);
        const defaultDamageunits = await exQuery(sql3);
        const defaultrepairs = await exQuery(sql4);

        if (req.query.id_c_d_s) {
            res.render('damages', { vcase, defaultDamages, defaultDamageunits, id_case, id_sector, sector_name, id_c_d_s, defaultrepairs });
        }
        else {

            const [results] = await exQuery(sql2);
            const damages = results;
            res.render('damages', { damages, vcase, defaultDamages, defaultDamageunits, id_case, id_sector, sector_name, defaultrepairs });
        }

    }
    catch(error) {
        console.log(error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }

});

router.post('/damages', isLoggedIn, async (req, res) => {

    try {
        const imageNames = await helpers.resizeImage(req.files);
        const id_c_d_s = req.body.id_c_d_s ? req.body.id_c_d_s : 0;
        console.log("valor c_d_s = " + id_c_d_s);
        insert1 = `CALL dataInsert(${req.body.id_sector},${id_c_d_s},${req.body.id_damage},${req.body.damage_size},${req.body.id_case},"${imageNames.image}","${imageNames.image1}","${imageNames.image2}",${req.body.inlineRadioOptions});`
        console.log(insert1);
        await exQuery(insert1);
        req.flash('success', 'Daño agregado satisfactoriamente');
        res.redirect(`/damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al agregar un daño ' + error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
})


router.post('/addDamageRepair', isLoggedIn, async (req, res) => {

    try {
        const id_case = req.body.id_case;
        const id_sector = req.body.id_sector;
        const id_repairs = req.body.id_repairs;
        const damage_name = req.body.damage_name;
        const damage_unit = req.body.damage_unit;
        const damage_desc = req.body.damage_desc;

        const id_repairs2 = id_repairs.join(',');
        console.log(JSON.stringify(id_repairs, null, 2) + "             v2  " + JSON.stringify(id_repairs2, null, 2))
        const query = `call addDamageRepair("${damage_name}","${damage_unit}","${damage_desc}","${id_repairs}","${req.user.adviser_name} ${req.user.adviser_lastname}")`;
        console.log(query)
        const q = exQuery(query)
        req.flash('success', 'El tipo de daño fue agregado satisfactoriamente');
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al agregar un tipo de daño ' + error);
        res.redirect(`damages?id_case=${req.body.id_case}&id_sector=${req.body.id_sector}`);

    }
})




router.get('/delreg', isLoggedIn, async (req, res) => {
    try {
        const adviser = req.user.id_adviser;
        const id_case = req.query.id_case;
        const id_c_d_s = req.query.id_c_d_s;
        const id_damage_images = req.query.id_damage_images;
        const id_sector = req.query.id_sector;
        const checkLastDamage = `Select count(*) FROM c_d_s where id_c_d_s=${id_c_d_s} and id_case=(select cases.id_case from cases where cases.id_adviser=${adviser} and cases.id_case=${id_case})`;

        const del = `DELETE FROM c_d_s where id_c_d_s=${id_c_d_s} and id_case=(select cases.id_case from cases where cases.id_adviser=${adviser} and cases.id_case=${id_case})`;
        const selectImagesDamages = `Select di.image1, di.image2, di.image3 from c_d_s cd
        inner join d_c_d_s dc
        on dc.id_c_d_s=cd.id_c_d_s
        inner join damage_images di
        on di.id_d_c_d_s=dc.id_d_c_d_s
        inner join cases c
        on c.id_case= cd.id_case
        where cd.id_sector=${req.query.id_sector} and cd.id_c_d_s=${id_c_d_s} and c.id_adviser=${req.user.id_adviser} and cd.id_case=${req.query.id_case};`;
        const upd = `update c_d_s SET id_damage=null WHERE id_c_d_s=${id_c_d_s} and c_d_s.id_sector=${req.query.id_sector} and c_d_s.id_case=${req.query.id_case};`

        const queryDelUp = checkLastDamage > 0 ? del : upd; //gestion para conservar registro de sector indepenciente exista o no daño
        resultsImagesDamages = await exQuery(selectImagesDamages);
        await exQuery(queryDelUp);

        await helpers.delFile(resultsImagesDamages);

        req.flash('success', 'Dato Eliminado correctamente');
        res.redirect(`/damages?id_case=${id_case}&id_sector=${id_sector}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al borrar');
        res.redirect(`/sectors?id_case=${id_case}`);
    }

})


router.get('/delsector', isLoggedIn, async (req, res) => {


    try {


        const delSector1 = `delete c_d_s from c_d_s inner join cases ON cases.id_case=c_d_s.id_case
         where c_d_s.id_sector= ${req.query.id_sector} and cases.id_case=${req.query.id_case} and cases.id_adviser=${req.user.id_adviser};`;
        const delSector2 = `delete dimentions from dimentions inner join cases on cases.id_case=dimentions.id_case
        where dimentions.id_sector = ${req.query.id_sector} and cases.id_case=${req.query.id_case} and cases.id_adviser= ${req.user.id_adviser}`;
        console.log(delSector1)
        const selectImagesDamages = `Select di.image1, di.image2, di.image3 from c_d_s cd
        inner join d_c_d_s dc
        on dc.id_c_d_s=cd.id_c_d_s
        inner join damage_images di
        on di.id_d_c_d_s=dc.id_d_c_d_s
        inner join cases c
        on c.id_case= cd.id_case
        where cd.id_sector=${req.query.id_sector} and c.id_adviser=${req.user.id_adviser} and cd.id_case=${req.query.id_case};`;

        const selectImagesDimentions = `select img1, img2 from dimentions inner join cases on cases.id_case=dimentions.id_case 
        where cases.id_case=${req.query.id_case} and dimentions.id_sector=${req.query.id_sector} and cases.id_adviser=${req.user.id_adviser}`;
        const sid = await exQuery(selectImagesDamages);
        const sidi = await exQuery(selectImagesDimentions);
        await exQuery(delSector1);
        await exQuery(delSector2);

        //await helpers.delFile(sid);
        await helpers.delFile(sidi);
        await helpers.delFile(sid);
        req.flash('success', 'Dato Eliminado correctamente');
        res.redirect(`/sectors?id_case=${req.query.id_case}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al borrar' + error);
        res.redirect(`/sectors?id_case=${req.query.id_case}`);

    }


})


router.get('/cases_crud', isAdmin, async (req, res) => {
    try {
        const id_case = req.query.id_case;
        const id_admin = req.user.id_adviser;
        const query = `call showCase(${id_case}, ${id_admin})`;
        let qdamage = `call queryDamages2(${req.user.id_adviser},${id_case});`;
        const showSectors = `call showSectors(${req.user.id_adviser},${req.query.id_case})`;
        const qadvisers = "select id_adviser, adviser_name, adviser_lastname from advisers";
        const qstatus = "select id_status, status_name from status";
        [results] = await exQuery(query);
        const [rowdamages] = await exQuery(qdamage);
        rowsQuery = results;
        const rowAdvisers = await exQuery(qadvisers);
        const rowStatus = await exQuery(qstatus);
        const [resSector] = await exQuery(showSectors);
        const organizedData = await pdfService.reOrdenar(rowdamages);
        //PD



        //console.log(JSON.stringify(organizedData, null, 2));
        res.render('cases_crud', { data: rowsQuery, data2: rowAdvisers, data3: rowStatus, rowSectors: resSector, rowDamages: organizedData });

    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al cargar el caso');
        res.redirect(`/cases`);
    }



})

router.post('/cases_crud', isAdmin, async (req, res) => {
    try {

        const queryupad = `update cases set id_adviser=${req.body.id_adviser} WHERE id_case=${req.body.id_case}`;
        const queryupst = `update cases set id_status=${req.body.id_status} WHERE id_case=${req.body.id_case}`;


        const exead = req.body.id_adviser && !req.body.id_status ? await exQuery(queryupad) : await exQuery(queryupst);
     

        res.redirect(`/cases_crud?id_case=${req.body.id_case}`);
    }
    catch (error) {
        console.log(error);
        req.flash('message', 'Ocurrió un error al cargar el caso  ' + error);
        res.redirect(`/cases`);

    }



})

router.get('/generate-pdf',isAdmin, async (req, res) => {

    const id_case = req.query.id_case;
    const id_admin = req.user.id_adviser;

    const query = `call showCase(${id_case}, ${id_admin})`;
    let qdamage = `call queryDamages2(${req.user.id_adviser},${id_case});`;
    const [rowdamages] = await exQuery(qdamage)
    const organizedData = await pdfService.reOrdenar(rowdamages);
    [results] = await exQuery(query);
    rowsQuery = results;

    try {
        const htmlContent = await pdfService.bodybuilder_pdf(rowsQuery, organizedData)
        const browser = await puppeteer.launch();
        const page = await browser.newPage();
        await page.setContent(htmlContent, { waitUntil: 'domcontentloaded' });

        const pdfBuffer = await page.pdf({
            margin: {              // Añade márgenes al documento
                top: '20mm',
                right: '20mm',
                bottom: '20mm',
                left: '20mm'
            },
            format: 'A4',
            printBackground: true,
        });

        await browser.close();
        res.setHeader('Content-Disposition', 'attachment; filename="Informe.pdf"');
        res.setHeader('Content-Type', 'application/pdf');
        res.send(pdfBuffer);
    } catch (err) {
        console.error('Error generating PDF:', err);
        res.status(500).send('Error generating PDF');
    }
});


router.get('/createPdf', isAdmin, async (req, res) => {

    try {
        let ruta = "";

        const id_case = req.query.id_case;
        const query = `call budget(${req.user.id_adviser},${id_case})`
        const query2 = `call showCase(${id_case}, ${req.user.id_adviser})`;
        const [organizedData] = await exQuery(query);
        // console.log(organizedData)
        const dataBody = await pdfService.reOrdenar_v2(organizedData);
        const [header_b] = await exQuery(query2);
        await pool.end((err)=>{
            console.log("Mysql Connection ends");
        })
        //const body = await pdfService.buildPDF(header_b, dataBody);


        const ds = await pdfService.createExcel(header_b, dataBody).then((err) => {
            if (err) {
                console.log('PDF no generado')
                req.flash("message", "Problemas con el documento")

            }
            console.log('PDF generado con éxito!')
            req.flash("success", "PDF generado con éxito!")

        });
        res.redirect('cases')




    }
    catch (error) {
        req.flash('message', 'Ocurrió un error en la creación del archivo ' + error);
        console.log(error)
        res.redirect(`/cases`);

    }
})
router.get('/clients', isAdmin, async (req, res) => {
    res.render('clients')
})

module.exports = router;

/*shift alt f  ordenar código
ctrl l seleccionar linea
ctrl d seleccionar coincidencia
shift alt selección por columna
ctrl f2 buscar coincidencias
*/