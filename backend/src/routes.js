import express from 'express'
import projectRoutes from './modules/projects/projects.routes.js'
import billRoutes from './modules/bills/bills.routes.js'
import testRoutes from './modules/test/test.routes.js'
import roleTestRoutes from './modules/test/role.test.js'


const router = express.Router()



router.use('/projects', projectRoutes)
router.use('/bills', billRoutes)
router.use('/test', testRoutes)
router.use('/test', roleTestRoutes)


export default router
