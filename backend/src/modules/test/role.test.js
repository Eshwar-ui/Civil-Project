import express from 'express'
import { authenticate } from '../../middleware/auth.middleware.js'
import { supabase } from '../../config/supabase.js'

const router = express.Router()

router.get('/role', authenticate, async (req, res) => {
  const { data, error } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', req.user.id)
    .single()

  if (error) {
    return res.status(400).json({ error: error.message })
  }

  res.json({
    user_id: req.user.id,
    role: data.role
  })
})

export default router
