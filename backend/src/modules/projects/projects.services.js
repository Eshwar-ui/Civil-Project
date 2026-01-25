import { supabase } from '../../config/supabase.js'

export async function createProject(data, adminId) {
  const { name, location, client_name } = data

  if (!name) throw new Error('Project name required')

  const { data: project, error } = await supabase
    .from('projects')
    .insert({
      name,
      location,
      client_name,
      status: 'ACTIVE',
      created_by: adminId
    })
    .select()
    .single()

  if (error) throw error

  return project
}

export async function listProjects(userId, role) {
  // Admin sees all
  if (role === 'ADMIN') {
    const { data, error } = await supabase
      .from('projects')
      .select('*')

    if (error) throw error
    return data
  }

  // Others see assigned only
  const { data, error } = await supabase
    .from('project_members')
    .select('projects(*)')
    .eq('user_id', userId)

  if (error) throw error

  return data.map(row => row.projects)
}
