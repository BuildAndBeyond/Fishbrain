const storageKey = "catchlog_html_v1";
const themeKey = "catchlog_theme";

const state = {
  rigs: [],
  sessions: [],
  catches: [],
  activeSessionId: null,
};

const elements = {
  navLinks: document.querySelectorAll(".nav-link"),
  panels: document.querySelectorAll(".panel"),
  rigForm: document.getElementById("rig-form"),
  rigList: document.getElementById("rig-list"),
  sessionForm: document.getElementById("new-session-form"),
  activeSessionLabel: document.getElementById("active-session-label"),
  liveSessionLabel: document.getElementById("live-session-label"),
  resumeSession: document.getElementById("resume-session"),
  endSession: document.getElementById("end-session"),
  catchForm: document.getElementById("catch-form"),
  catchList: document.getElementById("catch-list"),
  rigCount: document.getElementById("rig-count"),
  sessionCount: document.getElementById("session-count"),
  catchCount: document.getElementById("catch-count"),
  activeCatchCount: document.getElementById("active-catch-count"),
  activeDuration: document.getElementById("active-duration"),
  bestSpecies: document.getElementById("best-species"),
  bestWeight: document.getElementById("best-weight"),
  bestLength: document.getElementById("best-length"),
  recentCatches: document.getElementById("recent-catches"),
  exportData: document.getElementById("export-data"),
  resetData: document.getElementById("reset-data"),
  themeToggle: document.getElementById("toggle-theme"),
};

const emptyTemplate = document.getElementById("empty-state").content;

const formatDateTime = (iso) => new Date(iso).toLocaleString("de-DE");

const loadState = () => {
  const raw = localStorage.getItem(storageKey);
  if (!raw) {
    saveState();
    return;
  }
  try {
    const parsed = JSON.parse(raw);
    Object.assign(state, parsed);
  } catch (error) {
    console.error("Fehler beim Laden der Daten", error);
    saveState();
  }
};

const saveState = () => {
  localStorage.setItem(storageKey, JSON.stringify(state));
};

const setTheme = (theme) => {
  if (theme === "light") {
    document.documentElement.dataset.theme = "light";
  } else {
    delete document.documentElement.dataset.theme;
  }
  localStorage.setItem(themeKey, theme);
};

const toggleTheme = () => {
  const current = localStorage.getItem(themeKey) || "dark";
  setTheme(current === "dark" ? "light" : "dark");
};

const setActivePanel = (targetId) => {
  elements.panels.forEach((panel) => panel.classList.toggle("is-visible", panel.id === targetId));
  elements.navLinks.forEach((link) => link.classList.toggle("is-active", link.dataset.target === targetId));
};

const createId = () => Math.random().toString(36).slice(2, 10);

const renderList = (container, items, renderItem) => {
  container.innerHTML = "";
  if (!items.length) {
    container.append(emptyTemplate.cloneNode(true));
    return;
  }
  items.forEach((item) => container.append(renderItem(item)));
};

const renderRigItem = (rig) => {
  const wrapper = document.createElement("div");
  wrapper.className = "list-item";
  wrapper.innerHTML = `
    <div>
      <strong>${rig.name}</strong><br />
      <small>${[rig.rod, rig.reel, rig.line].filter(Boolean).join(" • ") || "Keine Details"}</small>
    </div>
    <button class="ghost" data-id="${rig.id}">Löschen</button>
  `;
  wrapper.querySelector("button").addEventListener("click", () => {
    state.rigs = state.rigs.filter((item) => item.id !== rig.id);
    saveState();
    refreshUI();
  });
  return wrapper;
};

const renderCatchItem = (catchItem) => {
  const wrapper = document.createElement("div");
  wrapper.className = "list-item";
  wrapper.innerHTML = `
    <div>
      <strong>${catchItem.species}</strong><br />
      <small>${[catchItem.weight && `${catchItem.weight} kg`, catchItem.length && `${catchItem.length} cm`]
        .filter(Boolean)
        .join(" • ") || "Ohne Maße"}</small><br />
      <small>${formatDateTime(catchItem.timestamp)}</small>
    </div>
    <button class="ghost" data-id="${catchItem.id}">Löschen</button>
  `;
  wrapper.querySelector("button").addEventListener("click", () => {
    state.catches = state.catches.filter((item) => item.id !== catchItem.id);
    saveState();
    refreshUI();
  });
  return wrapper;
};

const getActiveSession = () => state.sessions.find((session) => session.id === state.activeSessionId);

const refreshOverview = () => {
  const activeSession = getActiveSession();
  const activeCatches = state.catches.filter((item) => item.sessionId === state.activeSessionId);

  elements.rigCount.textContent = state.rigs.length;
  elements.sessionCount.textContent = state.sessions.length;
  elements.catchCount.textContent = state.catches.length;
  elements.activeCatchCount.textContent = activeCatches.length;
  elements.activeDuration.textContent = activeSession
    ? formatDuration(new Date(activeSession.startedAt))
    : "00:00";

  if (!activeSession) {
    elements.activeSessionLabel.textContent = "Keine aktive Session";
    elements.liveSessionLabel.textContent = "Keine aktive Session";
    elements.resumeSession.disabled = true;
    elements.endSession.disabled = true;
    elements.catchForm.querySelectorAll("input, textarea, button").forEach((el) => (el.disabled = true));
  } else {
    elements.activeSessionLabel.textContent = `${activeSession.waterbody} • ${formatDateTime(
      activeSession.startedAt
    )}`;
    elements.liveSessionLabel.textContent = `${activeSession.waterbody} • ${formatDateTime(
      activeSession.startedAt
    )}`;
    elements.resumeSession.disabled = false;
    elements.endSession.disabled = false;
    elements.catchForm.querySelectorAll("input, textarea, button").forEach((el) => (el.disabled = false));
  }
};

const formatDuration = (startDate) => {
  const diffMs = Date.now() - startDate.getTime();
  const minutes = Math.floor(diffMs / 60000);
  const hours = Math.floor(minutes / 60);
  const remaining = minutes % 60;
  return `${String(hours).padStart(2, "0")}:${String(remaining).padStart(2, "0")}`;
};

const refreshStats = () => {
  const catches = [...state.catches];
  if (!catches.length) {
    elements.bestSpecies.textContent = "—";
    elements.bestWeight.textContent = "—";
    elements.bestLength.textContent = "—";
    renderList(elements.recentCatches, [], () => document.createElement("div"));
    return;
  }

  const speciesCount = catches.reduce((acc, item) => {
    acc[item.species] = (acc[item.species] || 0) + 1;
    return acc;
  }, {});

  const topSpecies = Object.entries(speciesCount).sort((a, b) => b[1] - a[1])[0][0];
  const bestWeight = catches
    .map((item) => item.weight || 0)
    .reduce((max, value) => Math.max(max, value), 0);
  const bestLength = catches
    .map((item) => item.length || 0)
    .reduce((max, value) => Math.max(max, value), 0);

  elements.bestSpecies.textContent = topSpecies;
  elements.bestWeight.textContent = bestWeight ? `${bestWeight} kg` : "—";
  elements.bestLength.textContent = bestLength ? `${bestLength} cm` : "—";

  const recent = catches.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp)).slice(0, 5);
  renderList(elements.recentCatches, recent, renderCatchItem);
};

const refreshUI = () => {
  refreshOverview();
  renderList(elements.rigList, state.rigs, renderRigItem);
  const activeCatches = state.catches.filter((item) => item.sessionId === state.activeSessionId);
  renderList(elements.catchList, activeCatches, renderCatchItem);
  refreshStats();
};

const handleRigSubmit = (event) => {
  event.preventDefault();
  const formData = new FormData(event.target);
  state.rigs.unshift({
    id: createId(),
    name: formData.get("name"),
    rod: formData.get("rod"),
    reel: formData.get("reel"),
    line: formData.get("line"),
  });
  event.target.reset();
  saveState();
  refreshUI();
};

const handleSessionSubmit = (event) => {
  event.preventDefault();
  const formData = new FormData(event.target);
  const session = {
    id: createId(),
    waterbody: formData.get("waterbody"),
    target: formData.get("target"),
    notes: formData.get("notes"),
    startedAt: new Date().toISOString(),
    endedAt: null,
  };
  state.sessions.unshift(session);
  state.activeSessionId = session.id;
  event.target.reset();
  saveState();
  refreshUI();
  setActivePanel("live-session");
};

const handleCatchSubmit = (event) => {
  event.preventDefault();
  if (!state.activeSessionId) return;
  const formData = new FormData(event.target);
  state.catches.unshift({
    id: createId(),
    sessionId: state.activeSessionId,
    species: formData.get("species"),
    weight: formData.get("weight") ? Number(formData.get("weight")) : null,
    length: formData.get("length") ? Number(formData.get("length")) : null,
    notes: formData.get("notes"),
    timestamp: new Date().toISOString(),
  });
  event.target.reset();
  saveState();
  refreshUI();
};

const endSession = () => {
  if (!state.activeSessionId) return;
  const session = getActiveSession();
  if (session) {
    session.endedAt = new Date().toISOString();
  }
  state.activeSessionId = null;
  saveState();
  refreshUI();
};

const handleExport = () => {
  const blob = new Blob([JSON.stringify(state, null, 2)], { type: "application/json" });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = `catchlog-export-${new Date().toISOString().slice(0, 10)}.json`;
  document.body.appendChild(link);
  link.click();
  link.remove();
  URL.revokeObjectURL(url);
};

const handleReset = () => {
  if (!confirm("Alle Daten wirklich löschen?")) return;
  state.rigs = [];
  state.sessions = [];
  state.catches = [];
  state.activeSessionId = null;
  saveState();
  refreshUI();
};

const setupEventListeners = () => {
  elements.navLinks.forEach((link) => {
    link.addEventListener("click", () => setActivePanel(link.dataset.target));
  });

  elements.rigForm.addEventListener("submit", handleRigSubmit);
  elements.sessionForm.addEventListener("submit", handleSessionSubmit);
  elements.catchForm.addEventListener("submit", handleCatchSubmit);
  elements.resumeSession.addEventListener("click", () => setActivePanel("live-session"));
  elements.endSession.addEventListener("click", endSession);
  elements.exportData.addEventListener("click", handleExport);
  elements.resetData.addEventListener("click", handleReset);
  elements.themeToggle.addEventListener("click", toggleTheme);
};

const init = () => {
  loadState();
  setTheme(localStorage.getItem(themeKey) || "dark");
  setupEventListeners();
  refreshUI();
  setInterval(refreshOverview, 60000);
};

init();
