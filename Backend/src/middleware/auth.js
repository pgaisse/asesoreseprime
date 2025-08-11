require('dotenv').config();
const { auth } = require('express-oauth2-jwt-bearer');
const { expressjwt: jwt } = require('express-jwt');
const jwks = require('jwks-rsa');

console.log(process.env.AUDIENCE)
//console.log(process.env.AUDIENCE,process.env.ISSUERBASEURL)
const jwtCheck = auth({
  audience: process.env.AUDIENCE,
  issuerBaseURL: process.env.ISSUERBASEURL,
  tokenSigningAlg: 'RS256'
});


const checkJwt = jwt({
  secret: jwks.expressJwtSecret({
    cache: true,
    rateLimit: true,
    jwksRequestsPerMinute: 5,
    jwksUri: `https://${process.env.ISSUERBASEURL}/.well-known/jwks.json`
  }),
  audience: process.env.AUTH0_AUDIENCE,
  issuer: `https://${process.env.ISSUERBASEURL}/`,
  algorithms: ['RS256']
});

const attachUserInfo = (req, res, next) => {
  //console.log("REQ",req)
  if (req.auth && req.auth.payload) {
    req.user = {
      id: req.auth.payload.sub,
      role: req.auth.payload['https://letsmarter.com/role'],
      organization: req.auth.payload['https://letsmarter.com/organization'],
    };
  }
  next();
};

function decodeToken(token) {
  if (!token || token.split('.').length !== 3) {
    throw new Error('Token inválido');
  }

  const payloadBase64 = token.split('.')[1];
  const payload = JSON.parse(Buffer.from(payloadBase64, 'base64').toString('utf8'));

  return payload;
}

module.exports = {jwtCheck,attachUserInfo,checkJwt,decodeToken };
