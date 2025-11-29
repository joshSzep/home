manuscript:
    ./rebuild-manuscript.sh

pdf: manuscript
    pandoc MANUSCRIPT.md \
        -f markdown-implicit_figures \
        -o Home.pdf

epub: manuscript
    pandoc MANUSCRIPT.md \
        --epub-cover-image=front-cover.png \
        --metadata title="Home" \
        --metadata author="Joshua Szepietowski" \
        -o Home.epub

kfx: epub
    open -a "Kindle Previewer 3" \
        Home.epub

build: pdf epub kfx
    echo "All formats built: Home.pdf, Home.epub, Home.kfx"

clean:
    rm -f MANUSCRIPT.md Home.pdf Home.epub Home.kfx
