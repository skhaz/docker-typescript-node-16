if (!process.env.PORT) {
  throw new Error('PORT environment variable is not defined.')
}

export const { PORT } = process.env
