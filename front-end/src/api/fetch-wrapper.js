const BASE_API_URL = process.env.REACT_APP_BASE_API_URL;

// CRUD operations for API interactions

export async function create(endpoint, data) {
   const response = await fetch(`${BASE_API_URL}/${endpoint}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  });

  if (!response.ok) {
    return Promise.reject(new Error(`Failed to create data at ${endpoint}`));
  }

  return response.status === 204 ? null : response.json().catch(() => null);
}
 
export async function read(endpoint) {
  const response = await fetch(`${BASE_API_URL}/${endpoint}`);

    if (!response.ok) {
        return Promise.reject(new Error(`Failed to fetch data from ${endpoint}`));
    }

    return response.json();
}

export async function update(endpoint, data) {
   const response = await fetch(`${BASE_API_URL}/${endpoint}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  });

  if (!response.ok) {
    return Promise.reject(new Error(`Failed to update data at ${endpoint}`));
  }

  return null; // No content expected on successful update
}

export async function del(endpoint) {
  const response = await fetch(`${BASE_API_URL}/${endpoint}`, {
    method: 'DELETE'
  });

  if(!response.ok) {
    return Promise.reject(new Error(`Failed to delete data at ${endpoint}`));
  }

  return response.json();
}