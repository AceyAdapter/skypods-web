"use client";

import { useEffect } from "react";
import { checkAPI } from "../utils/api";

export default function Home() {
  useEffect(() => {
    checkAPI();
  }, []);

  return <div className="">SkyPods</div>;
}
