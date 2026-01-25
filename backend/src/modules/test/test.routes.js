import express from 'express'
import { supabase } from '../../config/supabase.js'

const router = express.Router()

router.get('/supabase', async (req, res) => {
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .limit(1)

  if (error) {
    return res.status(500).json({
      success: false,
      error: error.message
    })
  }

  res.json({
    success: true,
    message: 'Supabase connected successfully',
    data
  })
})

export default router
