import express from 'express'
import { supabase } from '../../config/supabase.js'
import { authenticate } from '../../middleware/auth.middleware.js'
import { allowRoles } from '../../middleware/role.middleware.js'

const router = express.Router()

router.post(
  '/',
  authenticate,
  allowRoles(['SITE_ENGINEER']),
  async (req, res) => {
    const { project_id, vendor_name, amount, bill_type } = req.body

    const { error } = await supabase.from('bills').insert({
      project_id,
      vendor_name,
      amount,
      bill_type,
      status: 'SUBMITTED',
      submitted_by: req.user.id
    })

    if (error) return res.status(400).json(error)

    res.json({ message: 'Bill submitted' })
  }
)

export default router
