#!/usr/bin/env node
import * as cdk from "aws-cdk-lib";
import { NetworkStack } from "../lib/network-stack.js";

const app = new cdk.App();

new NetworkStack(app, "IacStudyNetworkStack", {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION ?? "ap-northeast-2",
  },
  description: "Low-cost VPC stack for the IaC study CDK assignment",
});
