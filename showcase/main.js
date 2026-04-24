"use strict";

document.addEventListener("DOMContentLoaded", () => {
  const submitBtn = document.getElementById("contact-submit");
  const statusEl = document.getElementById("contact-status");
  const brandEl = document.getElementById("contact-brand");
  const channelEl = document.getElementById("contact-channel");
  const panelEl = document.getElementById("contact-panel");

  if (!submitBtn || !statusEl || !brandEl || !channelEl || !panelEl) {
    return;
  }

  const setStatus = (text, tone) => {
    statusEl.textContent = text;
    statusEl.classList.remove("ok", "error");
    if (tone) {
      statusEl.classList.add(tone);
    }
  };

  submitBtn.addEventListener("click", async () => {
    const brand = brandEl.value.trim() || "未填写";
    const channel = channelEl.value.trim() || "未填写";
    const panel = panelEl.value.trim() || "未填写";

    const message = [
      "【SlothVPN 白牌部署咨询】",
      `品牌名：${brand}`,
      `联系方式：${channel}`,
      `当前面板：${panel}`,
      "需求：希望部署一套可上线收款的白牌面板（含下载中心、iOS教程、AI助手、安装包）。",
      "来源：GitHub 演示站",
      `时间：${new Date().toLocaleString("zh-CN", { hour12: false })}`,
    ].join("\n");

    try {
      await navigator.clipboard.writeText(message);
      setStatus("已复制咨询内容，并正在打开 Telegram。进入聊天后直接粘贴发送即可。", "ok");
    } catch (error) {
      setStatus("已打开 Telegram，但自动复制失败，请手动复制后发送。", "error");
    }

    window.open("https://t.me/shulai2026", "_blank", "noopener,noreferrer");
  });
});
