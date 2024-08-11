# Ultroid - UserBot
# Copyright (C) 2021-2023 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# Please read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

# Use a specific version of Python for consistency
FROM python:3.12.5-bullseye

# Set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set working directory
WORKDIR /root/TeamUltroid

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        neofetch \
        git \
        curl \
        wget \
        mediainfo \
        ffmpeg && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/*

# Add application code
ADD . /root/TeamUltroid

# Run the installer script
RUN bash installer.sh

# Start the bot
CMD ["bash", "startup"]
