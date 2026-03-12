import { buildApp } from "./app";
import { config } from "./config";

const start = async () => {
  const app = buildApp();
  await app.listen({ host: config.host, port: config.port });
  app.log.info(`sloth-gateway listening on ${config.host}:${config.port}`);
};

start().catch((error) => {
  // eslint-disable-next-line no-console
  console.error("failed to start sloth-gateway", error);
  process.exit(1);
});
