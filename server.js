require('dotenv').config();
const express = require('express');
const { createClient } = require('@supabase/supabase-js');

const app = express();
app.use(express.json());

// initialize Supabase Client
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_KEY
);

// 1. GET /projects - retrieve all projects
app.get('/projects', async (req, res) => {
  const { data, error } = await supabase
    .from('projects')
    .select('*')
    .order('created_at', { ascending: false });

  if (error) {
    return res.status(500).json({
      status: 'error',
      message: error.message,
      code: 'DB_ERROR'
    });
  }

  return res.status(200).json({
    status: 'success',
    data: data
  });
});

// 2. POST /projects - create a new project
app.post('/projects', async (req, res) => {
  const { title, description } = req.body;

  // validation
  if (!title || title.trim() === '') {
    return res.status(400).json({
      status: 'error',
      message: 'Project title is required and cannot be empty.',
      code: 'VALIDATION_ERROR'
    });
  }

  // insert into Supabase
  const { data, error } = await supabase
    .from('projects')
    .insert([{ title, description }])
    .select()
    .single();

  if (error) {
    return res.status(500).json({
      status: 'error',
      message: error.message,
      code: 'DB_ERROR'
    });
  }

  return res.status(201).json({
    status: 'success',
    data: data
  });
});

// 3. GET /projects/:id - retrieve a single project by ID
app.get('/projects/:id', async (req, res) => {
  const { id } = req.params;

  const { data, error } = await supabase
    .from('projects')
    .select('*')
    .eq('id', id)
    .single();

  if (error || !data) {
    return res.status(404).json({
      status: 'error',
      message: "We couldn't find a project with that ID.",
      code: 'NOT_FOUND'
    });
  }

  return res.status(200).json({
    status: 'success',
    data: data
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});