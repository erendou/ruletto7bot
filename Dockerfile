FROM python:3.11-slim

RUN apt-get update && apt-get install -y     wget unzip curl gnupg ca-certificates fonts-liberation libnss3 libxss1 libasound2 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxrandr2 libgbm1 libgtk-3-0 libxshmfence1 libxext6 libxi6 libgl1-mesa-glx xvfb

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - &&     echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list &&     apt-get update &&     apt-get install -y google-chrome-stable

RUN CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+') &&     DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION") &&     wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$DRIVER_VERSION/chromedriver_linux64.zip &&     unzip /tmp/chromedriver.zip -d /usr/local/bin/ &&     chmod +x /usr/local/bin/chromedriver

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["sh", "start.sh"]
