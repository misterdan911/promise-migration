-- 1. Field email di index karena sering dipakai untuk pengecekan login
CREATE INDEX idx_ref_user_email ON ref_user(email);

-- 2. Field token di index karena sering dipakai untuk pengecekan
CREATE INDEX idx_ref_user_api_token ON ref_user(api_token) 
WHERE api_token IS NOT NULL;

-- 3. status user di index karena pasti di cek
CREATE INDEX idx_ref_user_status ON ref_user(status_user);




