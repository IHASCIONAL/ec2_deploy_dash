FROM python:3.9-slim

# Instala dependências básicas do sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Instala o Streamlit
RUN pip install --no-cache-dir streamlit

# Define diretório de trabalho
WORKDIR /app

# Copia o app
COPY ./app.py .

# Expõe a porta padrão do Streamlit
EXPOSE 8501

# Comando de inicialização
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
