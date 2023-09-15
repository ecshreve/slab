#!/bin/bash

# Run the agent
docker run -e TFC_AGENT_TOKEN -d hashicorp/tfc-agent:latest