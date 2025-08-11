import { defineConfig } from 'vite'

import react from '@vitejs/plugin-react'
import tsconfigPaths from "vite-tsconfig-paths"
import fs from 'fs'
// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tsconfigPaths()],
  server: {
    https: {
      key: fs.readFileSync('/etc/letsencrypt/live/letsmarter.com/privkey.pem'),
      cert: fs.readFileSync('/etc/letsencrypt/live/letsmarter.com/fullchain.pem')
    },
    allowedHosts: ['letsmarter.com',""],
    host: '0.0.0.0',
    port: 3030, // aquí defines el puerto que quieres usar
     watch: {
      usePolling: true,
    },
  },

})