import jwt, { type JwtPayload, type SignOptions } from "jsonwebtoken";
import { config } from "../config";
import { AppError, ErrorCodes } from "../errors";

export type AccessTokenPayload = JwtPayload & {
  typ: "access";
  sid: string;
};

export type PullTokenPayload = JwtPayload & {
  typ: "sub_pull";
  sid: string;
};

export type BindExchangePayload = JwtPayload & {
  typ: "bind_exchange";
  bind_id: string;
  device_id: string;
  xboard_auth_data: string;
  xboard_token?: string;
  user_email?: string;
  user_uuid?: string;
};

const sign = (payload: object, expiresIn: string): string => {
  const options: SignOptions = { expiresIn: expiresIn as SignOptions["expiresIn"] };
  return jwt.sign(payload, config.jwtSecret, options);
};

export const signAccessToken = (sid: string): string => sign({ typ: "access", sid }, config.accessTokenExpires);
export const signRefreshToken = (sid: string): string => sign({ typ: "refresh", sid }, config.refreshTokenExpires);
export const signPullToken = (sid: string): string => sign({ typ: "sub_pull", sid }, config.pullTokenExpires);

export const signBindExchangeToken = (payload: Omit<BindExchangePayload, keyof JwtPayload | "typ">): string =>
  sign({ typ: "bind_exchange", ...payload }, config.bindTokenExpires);

const verify = <T extends JwtPayload>(token: string): T => {
  try {
    return jwt.verify(token, config.jwtSecret) as T;
  } catch (error) {
    throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Invalid or expired token", error);
  }
};

export const verifyAccessToken = (token: string): AccessTokenPayload => {
  const payload = verify<AccessTokenPayload>(token);
  if (payload.typ !== "access") throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Invalid access token type");
  return payload;
};

export const verifyPullToken = (token: string): PullTokenPayload => {
  const payload = verify<PullTokenPayload>(token);
  if (payload.typ !== "sub_pull") throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Invalid pull token type");
  return payload;
};

export const verifyBindExchangeToken = (token: string): BindExchangePayload => {
  const payload = verify<BindExchangePayload>(token);
  if (payload.typ !== "bind_exchange") {
    throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Invalid bind exchange token type");
  }
  return payload;
};
