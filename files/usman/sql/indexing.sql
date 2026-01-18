-- 1. Field email di index karena sering dipakai untuk pengecekan login
CREATE INDEX idx_ref_user_email ON ref_user(email);

-- 2. Index on api_token for authentication lookups
CREATE INDEX idx_ref_user_api_token ON ref_user(api_token) 
WHERE api_token IS NOT NULL;

-- 3. Index on status_user for filtering active/inactive users
CREATE INDEX idx_ref_user_status ON ref_user(status_user);

-- 4. Composite index for user management queries
CREATE INDEX idx_ref_user_status_created ON ref_user(status_user, udcr);