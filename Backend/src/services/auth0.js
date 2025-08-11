// services/auth0.js
require('dotenv').config();
const { ManagementClient } = require('auth0');

const management = new ManagementClient({
  domain: process.env.AUTH0_DOMAIN,
  clientId: process.env.MGMT_CLIENT_ID,
  clientSecret: process.env.MGMT_CLIENT_SECRET,
  scope: 'read:users read:organization_members'
});

async function getUsersFromOrganization(organizationId) {
  try {
    const users = await management.organizations.getMembers({ id: organizationId });
    return users;
  } catch (err) {
    console.error('Error getting users from organization:', err);
    throw err;
  }
}

module.exports = {
  getUsersFromOrganization
};
