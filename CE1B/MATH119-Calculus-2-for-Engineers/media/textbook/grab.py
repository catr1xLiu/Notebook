import urllib.request
import urllib.parse
from bs4 import BeautifulSoup
import os

base_url = "https://math.libretexts.org/Bookshelves/Calculus/Calculus_(OpenStax)/10%3A_Power_Series"
req = urllib.request.Request(base_url, headers={"User-Agent": "Mozilla/5.0"})
html = urllib.request.urlopen(req).read()
soup = BeautifulSoup(html, "html.parser")
links = soup.find_all("a", href=True)

sections = []
for a in links:
    href = a["href"]
    if "10%3A_Power_Series/10." in href and "Exercises" not in href and "Review" not in href:
        if href not in sections:
            sections.append(href)

index_append = "\n## 10:_Power_Series\n\n"

for sec_href in sorted(sections):
    sec_name_encoded = sec_href.split("/")[-1]
    sec_name = urllib.parse.unquote(sec_name_encoded)
    
    print("Processing", sec_name)
    index_append += f"### {sec_name}\n\n"
    
    sec_url = sec_href if sec_href.startswith("http") else urllib.parse.urljoin(base_url, sec_href)
    req = urllib.request.Request(sec_url, headers={"User-Agent": "Mozilla/5.0"})
    sec_html = urllib.request.urlopen(req).read()
    sec_soup = BeautifulSoup(sec_html, "html.parser")
    
    figures = sec_soup.find_all("figure")
    for i, fig in enumerate(figures):
        img = fig.find("img")
        caption = fig.find("figcaption")
        if img and img.get("src"):
            img_src = img.get("src")
            img_url = img_src if img_src.startswith("http") else urllib.parse.urljoin(sec_url, img_src)
            
            prefix = sec_name.split(":")[0].replace(".", "_")
            ext = ".png"
            if ".jpg" in img_url.lower(): ext = ".jpg"
            elif ".svg" in img_url.lower(): ext = ".svg"
            
            img_filename = f"{prefix}_fig_{i+1}{ext}"
            
            try:
                print("Downloading", img_filename, "from", img_url)
                img_req = urllib.request.Request(img_url, headers={"User-Agent": "Mozilla/5.0"})
                img_data = urllib.request.urlopen(img_req).read()
                with open(img_filename, "wb") as f:
                    f.write(img_data)
            except Exception as e:
                print("Error downloading", img_url, e)
                continue
            
            cap_text = caption.text.strip().replace("\n", " ") if caption else f"Figure {i+1}"
            
            index_append += f"**{img_filename}**\n\n"
            index_append += f"![{cap_text}](./media/textbook/{img_filename})\n\n"
            index_append += f"*{cap_text}*\n\n"

with open("INDEX.md", "a") as f:
    f.write(index_append)
print("Done appending to INDEX.md")
