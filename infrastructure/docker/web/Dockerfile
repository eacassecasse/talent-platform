FROM node:22-alpine

RUN corepack enable

WORKDIR /workspace

COPY \
package.json \
pnpm-lock.yaml \
pnpm-workspace.yaml \
./

COPY apps/web/package.json \
apps/web/

RUN pnpm install \
--frozen-lockfile

COPY . .

WORKDIR /workspace/apps/web

EXPOSE 5173

HEALTHCHECK \
--interval=30s \
--timeout=5s \
--retries=3 \
CMD wget \
--spider \
-q \
http://localhost:5173 \
|| exit 1

CMD ["pnpm", "run", "dev", "--host", "0.0.0.0"]