// routes/users.js
const express = require('express');
const router = express.Router();
const pool = require('../database');
const { getUsersFromOrganization } = require('../services/auth0');
const helpers = require('../lib/helpers');

const ORGANIZATION_ID = 'org_6Z0n9AqgRrpBsNvv';






router.get('/', async (req, res) => {
  try {
    const users = await getUsersFromOrganization(ORGANIZATION_ID);
    const inserted = [];
    const skipped = [];

    for (const user of users.data) {
      const query = `
        INSERT INTO advisers (
          id_adviser, adviser_name, adviser_email,
          adviser_username, adviser_password, adviser_role,
          adviser_lastname, adviser_rut, adviser_phone, adviser_birthday
        )
        SELECT ?, ?, ?, '', '', '', '', '', '', CURDATE()
        FROM DUAL
        WHERE NOT EXISTS (
          SELECT 1 FROM advisers WHERE id_adviser = ?
        )
        LIMIT 1;
      `;

      const [result] = await pool.query(query, [
        user.user_id,
        user.name,
        user.email,
        user.user_id,
      ]);

      if (result.affectedRows > 0) {
        console.log(`✔ Adviser insertado: ${user.user_id}`);
        inserted.push(user.user_id);
      } else {
        console.log(`⏭ Adviser ya existe: ${user.user_id}`);
        skipped.push(user.user_id);
      }
    }

    // ✅ Aquí se envía la respuesta FINAL
    res.json([users]);

  } catch (error) {
    console.error('❌ Error en la sincronización:', error);
    res.status(500).json({ error: 'Error al sincronizar advisers' });
  }
});

module.exports = router;
