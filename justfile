manuscript:
    ./rebuild-manuscript.sh

pdf: manuscript
    pandoc MANUSCRIPT.md \
        -f markdown-implicit_figures \
        -o Home.pdf

epub: manuscript
    ./rebuild-epub.sh

build: pdf epub
    echo "All formats built: Home.pdf and Home.epub"

clean:
    rm -f MANUSCRIPT.md Home.pdf Home.epub
