#!/bin/bash
cd "$(dirname "$0")"
PORT=8080
echo "╔══════════════════════════════════╗"
echo "║  ПроФильтр 2.0 — Запуск на Mac  ║"
echo "╚══════════════════════════════════╝"
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
    open "http://localhost:$PORT"; exit 0
fi
if command -v python3 &>/dev/null; then
    echo "Запуск... Браузер откроется через 2 сек"
    (sleep 2 && open "http://localhost:$PORT") &
    python3 -m http.server $PORT
elif command -v python &>/dev/null; then
    (sleep 2 && open "http://localhost:$PORT") &
    python -m SimpleHTTPServer $PORT
else
    open "$(dirname "$0")/index.html"
fi
