export type TrafficUnit = "auto" | "bytes" | "kb" | "mb" | "gb" | "tb";

const KB = 1024;
const MB = 1024 * KB;
const GB = 1024 * MB;
const TB = 1024 * GB;

const parseNumber = (value: unknown): number => {
  if (typeof value === "number" && Number.isFinite(value)) return value;
  if (typeof value === "string") {
    const parsed = Number(value);
    if (Number.isFinite(parsed)) return parsed;
  }
  return 0;
};

const parseUnit = (value: string | undefined): TrafficUnit => {
  const raw = String(value ?? "auto").trim().toLowerCase();
  if (raw === "bytes" || raw === "kb" || raw === "mb" || raw === "gb" || raw === "tb") return raw;
  return "auto";
};

const multiply = (value: number, unit: Exclude<TrafficUnit, "auto">): number => {
  const normalized = Math.max(0, value);
  switch (unit) {
    case "bytes":
      return normalized;
    case "kb":
      return normalized * KB;
    case "mb":
      return normalized * MB;
    case "gb":
      return normalized * GB;
    case "tb":
      return normalized * TB;
  }
};

const inferUnit = (quotaRaw: number): Exclude<TrafficUnit, "auto"> => {
  // XBoard instances in the wild return quota in one of:
  // - bytes (very large, e.g. 10737418240 for 10 GB)
  // - MB (e.g. 10240 for 10 GB)
  // - GB (e.g. 10 for 10 GB)
  if (quotaRaw >= MB) return "bytes";
  if (quotaRaw >= 4096) return "mb";
  return "gb";
};

export const normalizeTrafficUnit = (value: string | undefined): TrafficUnit => parseUnit(value);

export const normalizeTrafficQuota = (
  rawValue: unknown,
  configuredUnit: string | undefined,
): { raw: number; bytes: number; unit: Exclude<TrafficUnit, "auto"> } => {
  const raw = Math.max(0, parseNumber(rawValue));
  const unit = parseUnit(configuredUnit);
  const resolved = unit === "auto" ? inferUnit(raw) : unit;
  return {
    raw,
    bytes: Math.round(multiply(raw, resolved)),
    unit: resolved,
  };
};

export const normalizeTrafficSummary = (
  totalRawValue: unknown,
  usedRawValue: unknown,
  configuredUnit: string | undefined,
): {
  totalRaw: number;
  usedRaw: number;
  totalBytes: number;
  usedBytes: number;
  unit: Exclude<TrafficUnit, "auto">;
} => {
  const totalRaw = Math.max(0, parseNumber(totalRawValue));
  const usedRaw = Math.max(0, parseNumber(usedRawValue));
  const unit = parseUnit(configuredUnit);
  const resolved = unit === "auto" ? inferUnit(totalRaw > 0 ? totalRaw : usedRaw) : unit;
  return {
    totalRaw,
    usedRaw,
    totalBytes: Math.round(multiply(totalRaw, resolved)),
    usedBytes: Math.round(multiply(usedRaw, resolved)),
    unit: resolved,
  };
};
