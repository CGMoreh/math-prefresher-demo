# Git and GitHub Crash Course

### Caveat!

* This is an informal and shallow introduction to Git, GitHub, and markdown, meant to provide a basic understanding.
* Sorry Window users, this 1-hour course will be based on Mac OS (e.g. keyboard shorcuts)

### Resources

* [GitHub Tutorial](https://docs.github.com/en/get-started/quickstart/set-up-git)
* [Happy Git](https://happygitwithr.com)

**Software**
* [GitHub Desktop](https://desktop.github.com): GitHub desktop app
* [GitHub Copilot](https://github.com/features/copilot/): AI for coding ([tutorial](https://docs.github.com/en/copilot/quickstart))
* [Visual Studio Code](https://code.visualstudio.com): editor (an alternative to RStudio)

### Basics

*Inspired by [Tyler Simko](https://tylersimko.com) ([the BEST TF in Harvard](https://gsas.harvard.edu/news/tyler-simko-2023-derek-c-bok-award-citation))'s GovCodes material!*

* Git: version control system = a system that records changes
    * Allows you to revert back to old versions easily
    * Comparing workflows (in general):

    | Cloud Storage (e.g. Google Drive, Dropbox)| Git|
    |--|--|
    | All the changes you make in your computer sync automatically (with some *loss of control*…)| 1. Make multiple changes across different files within a project folder |
    | | 2. Choose some of updated files to create a new version (`git add`)|
    | | 3. Write a message describing the changes to record the version (`git commit`)|
    | | 4. You send the new version to the “remote repository,” a clone of your project stored somewhere in the internet (`git push`)|
    * Don’t worry! You can do this by clicking some buttons in RStudio.

* GitHub: a home for your Git-based projects on the internet (just like Google Drive/Dropbox!)
    * Recall that we sent the new version to the remote repository at the end of the workflow.
    * GitHub is where the remote repository lives!
    * Other hosting services: Bitbucket, GitLab, etc.
    * Think of it as your home in internet, which is connected to Rstudio in your laptop.


*md? rmd? qmd? tex?*
* Markdown: 
> At its core markdown is just plain text. Plain text does not have any formatting embedded in it. Instead, the formatting is coded up as text. Markdown is not a WYSIWYG (What you see is what you get) text editor like Microsoft Word or Google Docs. This will mean that you need to explicitly code for bold{text} rather than hitting Command+B and making your text look bold on your own computer.
* R Markdown = Markdown + R
    * [R Markdown Tutorial](https://rmarkdown.rstudio.com/lesson-1.html)
    * [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
* Quarto: next generation of rmd

> R Markdown (`.Rmd`) files have long been the go-to for reproducible writing workflows for R users. In 2022, [Posit, PBC](https://posit.co/), who created R Markdown announced a new generation of markdown extensions, with Quarto. Quarto (`.qmd`) files are a variation on R Markdown which allows for including R, python, Observable, Julia, and more within a document. Quarto is largely compatible with older `.Rmd` files, just by changing the extension. As such, you can integrate LaTeX and markdown seamlessly. Some benefits of using Quarto include:
> * [ease of customization with template partials](https://quarto.org/docs/journals/templates.html#template-partials)
> * [journal submission templates for many journals](https://quarto.org/docs/extensions/listing-journals.html)
> * [dozen of output types](https://quarto.org/docs/reference/)
> * [the ability to make websites interacting only with Quarto](https://quarto.org/docs/websites/)

* LaTeX: a typesetting program
    * What you'll be using to write your journal article, etc.
    * [Ch. 13.3 of Booklet](https://iqss.github.io/prefresher/nonwysiwyg.html#latex)
    * Check [Overleaf](https://www.overleaf.com/) (sign-up with your harvard account!)

### References

* [Kosuke's GitHub](https://github.com/kosukeimai)
* [Matt's GitHub](https://github.com/mattblackwell)
* [Chris's GitHub](https://github.com/christopherkenny)

**What you can post on GitHub as a git repo**
* R package (as a replication packet): [DIDdesign](https://github.com/naoki-egami/DIDdesign)
* R package (designed for various other purposes): [ppmf](https://github.com/christopherkenny/ppmf)
* Book: [Math Prefresher Bookdown](https://github.com/IQSS/prefresher), [qss](https://github.com/kosukeimai/qss)
* Course website: [Gov2002](https://github.com/mattblackwell/gov2002-f23)
* Personal website: distill article ([tutorial](https://gov50.mattblackwell.org/assignments/distill.html))
* Reading list: [free-programming-books](https://github.com/EbookFoundation/free-programming-books)
* Distributing problem sets: [GitHub Classroom](https://hmc-cs-131-spring2020.github.io/howtos/assignments.html)
* BibTex: [Gary's BibTeX](https://github.com/iqss-research/gkbibtex/blob/master/gk.bib)
* ...

### Collaboration with others
1. Git branch: think of it as multiple versions of your repo (see this [instruction](https://www.atlassian.com/git/tutorials/using-branches))
1. Git `stash`: saves the uncommitted changes locally (see this [post](https://opensource.com/article/21/4/git-stash))
1. Pull request: 
    * Usage: When you want to request the maintainer of the git repo to reflect your changes. 
    * Merge conflict: [Resolve on GitHub](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-on-github) (recommended)

### Misc

1. Toggling hidden files in Mac OS: `cmd + shift + . (period)` 
1. Command-line: On terminal, try `ls` and `cd <subdirectory>` ([instruction](https://iqss.github.io/prefresher/commandline-git.html#command-line))
1. Vim: may increase your productivity ([tutorial](https://www.openvim.com))
1. I personally like creating to-do list using markdown

- [x] Math Prefresher done!
- [ ] Your Ph.D. journey to be continued...