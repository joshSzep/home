manuscript:
    ./rebuild-manuscript.sh

pdf: manuscript
    pandoc MANUSCRIPT.md -o Home.pdf

epub: manuscript
    pandoc MANUSCRIPT.md \
        --epub-cover-image=front-cover.png \
        --metadata title="Home" \
        -o Home.epub

kfx: epub
    open -a "Kindle Previewer" Home.epub