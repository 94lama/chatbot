import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  env:{
    ORGANIZATION:process.env.ORGANIZATION,
    PROJECT:process.env.PROJECT,
    OPENAI_API_KEY:process.env.OPENAI_API_KEY,
  }
};

export default nextConfig;
