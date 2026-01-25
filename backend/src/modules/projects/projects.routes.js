import express from 'express'
import { supabase } from '../../config/supabase.js'
import { authenticate } from '../../middleware/auth.middleware.js'
import { allowRoles } from '../../middleware/role.middleware.js'
import { createProject, listProjects } from './projects.services.js'

const router = express.Router()

// Create Project (Admin)
router.post(
  '/',
  authenticate,
  allowRoles(['ADMIN']),
  async (req, res) => {
    try {
      const project = await createProject(req.body, req.user.id)
      res.status(201).json(project)
    } catch (err) {
      res.status(400).json({ error: err.message })
    }
  }
)

// List Projects (Role-based)
router.get(
  '/',
  authenticate,
  async (req, res) => {
    try {
      const projects = await listProjects(req.user.id, req.role)
      res.json(projects)
    } catch (err) {
      res.status(400).json({ error: err.message })
    }
  }
)

router.post(
  '/:projectId/assign',
  authenticate,
  allowRoles(['ADMIN']),
  async (req, res) => {
    const { projectId } = req.params
    const { user_id } = req.body

    const { error } = await supabase
      .from('project_members')
      .insert({
        project_id: projectId,
        user_id
      })

    if (error) return res.status(400).json(error)

    res.json({ message: 'User assigned to project' })
  }
)


export default router
