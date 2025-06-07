from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time

def setup_driver():
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--no-sandbox')
    driver = webdriver.Chrome(options=options)
    return driver

def kontrol_et(driver):
    driver.get("https://olabahis644.com/en/Slots/StartPragmaticPlay?gameId=101")
    time.sleep(10)  # Site tamamen yüklenene kadar bekle

    # Burada site yapısına göre verileri çekebilirsin.
    # Örnek olarak sayfa başlığını yazdırıyoruz:
    print("Sayfa başlığı:", driver.title)

    # Örnek: Tüm renk kutularını bul (burayı siteye göre değiştir)
    # elements = driver.find_elements(By.CLASS_NAME, "color-class-name")
    # for el in elements:
    #     print(el.text)

if __name__ == "__main__":
    driver = setup_driver()
    try:
        kontrol_et(driver)
    finally:
        driver.quit()
