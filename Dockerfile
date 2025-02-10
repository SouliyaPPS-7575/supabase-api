FROM supabase/postgres:17.0.1.34-orioledb

# Install Supabase CLI
RUN apt update && apt install -y curl wget unzip && \
    curl -fsSL https://get.supabase.com/install | sh

# Define build arguments
ARG DATABASE_URL
ARG SUPABASE_URL
ARG SUPABASE_ANON_KEY
ARG SUPABASE_SERVICE_ROLE_KEY
ARG ENABLE_STORAGE
ARG ENABLE_REALTIME

# Set Environment Variables
ENV DATABASE_URL='postgresql://${{PGUSER}}:${{POSTGRES_PASSWORD}}@${{RAILWAY_PRIVATE_DOMAIN}}:5432/${{PGDATABASE}}'
ENV SUPABASE_URL=https://supabase-api.up.railway.app
ENV SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzM5MTIwNDAwLAogICJleHAiOiAxODk2ODg2ODAwCn0.yBVbXtI4cAt07I_K7GwJhm0CYmnPKKLwP0G9T_hUiEU
ENV SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogInNlcnZpY2Vfcm9sZSIsCiAgImlzcyI6ICJzdXBhYmFzZSIsCiAgImlhdCI6IDE3MzkxMjA0MDAsCiAgImV4cCI6IDE4OTY4ODY4MDAKfQ.vEFTpO4u95uuRQj3SlHmIo2xJgSVFtRf5GByGfsy990
ENV ENABLE_STORAGE=true
ENV ENABLE_REALTIME=true

# Set PATH to include Supabase CLI
ENV PATH="/root/.supabase/bin:$PATH"

CMD ["sh", "-c", "supabase start"]