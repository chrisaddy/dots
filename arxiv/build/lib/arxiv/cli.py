import typer
from colorama import Fore, Back, Style, init
import os
import requests
from bs4 import BeautifulSoup
import pandas as pd
import datetime

init()

unprocessed_file = "~/Sync/arxiv/unprocessed.csv"
processed_file = "~/Sync/arxiv/processed.csv"

app = typer.Typer()

def install(section):
    url = f"http://export.arxiv.org/rss/{section}"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, "xml")
    articles = soup.find("rdf:RDF").find_all("item")

    arts = []
    for article in articles:
        arts.append({
            "time": datetime.datetime.utcnow().isoformat(),
            "section": section,
            "link": article.find("link").text,
            "title": article.find("title").text.split(" (arXiv")[0]
        })

    already_processed = pd.read_csv(processed_file)["link"].tolist()
    downloaded = pd.DataFrame(arts)
    downloaded = downloaded[~downloaded["link"].isin(already_processed)]
    unprocessed = pd.read_csv(unprocessed_file)

    new = downloaded.append(unprocessed).drop_duplicates()
    new.to_csv(unprocessed_file, index=False)


@app.command("install")
def install_articles():
    typer.secho("installing computer vision", fg=typer.colors.YELLOW)
    install("cs.CV")
    typer.secho("installing artificial intelligence", fg=typer.colors.YELLOW)
    install("cs.AI")
    typer.secho("installing computation and language", fg=typer.colors.YELLOW)
    install("cs.CL")
    typer.secho("installing computers and society", fg=typer.colors.YELLOW)
    install("cs.CY")
    typer.secho("installing data structures and algorithms", fg=typer.colors.YELLOW)
    install("cs.DS")
    typer.secho("installing human-computer interaction", fg=typer.colors.YELLOW)
    install("cs.HC")
    typer.secho("installing information retrieval", fg=typer.colors.YELLOW)
    install("cs.IR")
    typer.secho("installing machine learning", fg=typer.colors.YELLOW)
    install("cs.LG")
    typer.secho("installing programming languages", fg=typer.colors.YELLOW)
    install("cs.PL")
    typer.secho("installing statistics", fg=typer.colors.YELLOW)
    install("stat")



@app.command("review")
def review():
    to_process = pd.read_csv("~/Sync/arxiv/unprocessed.csv")[["link", "title"]]
    shuffled = to_process.sample(frac=1)

    to_review = shuffled.head(10).to_dict(orient='records')

    reviewed = []
    for article in to_review:
        typer.secho(article["title"], fg=typer.colors.GREEN)
        save = typer.prompt("save? [y/n]")
        if save.lower() in ["y", "yes"]:
            os.system(f"buku -a {article['link']}")
        reviewed.append(article["link"])

    unprocessed = to_process[~to_process["link"].isin(reviewed)]
    processed = to_process[to_process["link"].isin(reviewed)]

    already_processed = pd.read_csv(processed_file)
    already_processed.append(processed).drop_duplicates().to_csv(processed_file, index=False)
    unprocessed.to_csv(unprocessed_file, index=False)

    typer.secho(f"{unprocessed.shape[0]} left to process", fg=typer.colors.YELLOW)
