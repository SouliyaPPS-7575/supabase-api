FROM supabase/postgres:15

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
ENV DATABASE_URL=${DATABASE_URL}
ENV SUPABASE_URL=${SUPABASE_URL}
ENV SUPABASE_ANON_KEY=${SUPABASE_ANON_KEY}
ENV SUPABASE_SERVICE_ROLE_KEY=${SUPABASE_SERVICE_ROLE_KEY}
ENV ENABLE_STORAGE=${ENABLE_STORAGE}
ENV ENABLE_REALTIME=${ENABLE_REALTIME}

# Set PATH to include Supabase CLI
ENV PATH="/root/.supabase/bin:$PATH"

CMD ["sh", "-c", "supabase start"]