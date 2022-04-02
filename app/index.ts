import express from 'express'

import { PORT } from './environment'

const app = express()

app.listen(PORT, () => {
  process.on('SIGINT', async () => {
    process.exit()
  })
})
