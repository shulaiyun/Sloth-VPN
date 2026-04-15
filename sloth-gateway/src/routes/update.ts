import type { FastifyInstance } from "fastify";
import { config } from "../config";
import { ok } from "../utils/response";

const nonEmpty = (value: string): string | null => {
  const text = value.trim();
  return text.length > 0 ? text : null;
};

const positiveNumberOrNull = (value: number): number | null => {
  return Number.isFinite(value) && value > 0 ? value : null;
};

export const registerUpdateRoutes = (app: FastifyInstance): void => {
  app.get("/api/app/v1/app/update-policy", async (request, reply) => {
    const query = (request.query ?? {}) as Record<string, unknown>;
    const platform = String(query.platform ?? "").trim().toLowerCase();
    const currentBuild = Number(query.build_number ?? query.build ?? 0);

    const latestVersion = nonEmpty(config.appUpdateLatestVersion);
    const latestBuild = positiveNumberOrNull(config.appUpdateLatestBuild);
    const minSupportedBuild = positiveNumberOrNull(config.appUpdateMinSupportedBuild);

    const forceByBuild =
      Number.isFinite(currentBuild) &&
      currentBuild > 0 &&
      minSupportedBuild !== null &&
      currentBuild < minSupportedBuild;

    const force = config.appUpdateForce || forceByBuild;
    const enabled = latestVersion !== null || latestBuild !== null || minSupportedBuild !== null || force;

    return ok(reply, {
      enabled,
      platform: platform.length > 0 ? platform : null,
      latest_version: latestVersion,
      latest_build: latestBuild,
      min_supported_build: minSupportedBuild,
      force,
      title: nonEmpty(config.appUpdateTitle),
      message: nonEmpty(config.appUpdateMessage),
      download_url: config.appUpdateDownloadUrl,
      checked_at: new Date().toISOString(),
    });
  });
};

