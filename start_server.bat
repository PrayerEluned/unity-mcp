@echo off
cd mcp-server-python
echo Installing dependencies...
pip install .
echo.
echo Starting MCP Server for Unity...
echo Keep this window open while using Antigravity with Unity.
echo.
python -m src.main --transport http --http-port 8080
pause
