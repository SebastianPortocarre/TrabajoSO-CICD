# deps: instala dependencias
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# test: corre Jest dentro del contenedor
FROM deps AS test
WORKDIR /app
COPY . .
CMD ["npm", "test", "--", "--ci", "--color=false"]

# prod (opcional)
FROM deps AS prod
WORKDIR /app
COPY . .
CMD ["node", "-e", "console.log('App lista')"]
