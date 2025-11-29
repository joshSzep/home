#!/bin/zsh

# Rebuild MANUSCRIPT.md by concatenating all chapters from the Home directory
# Chapters are separated by --- dividers

OUTPUT_FILE="MANUSCRIPT.md"
HOME_DIR="Home"

# Start with the header
cat > "$OUTPUT_FILE" << 'EOF'
# HOME

**A Novel by Joshua Szepietowski**

EOF

# Part I: Detection
echo "\n---\n\n# PART I: DETECTION" >> "$OUTPUT_FILE"

for chapter in "$HOME_DIR/Part I: Detection"/*.md; do
    echo "\n---\n" >> "$OUTPUT_FILE"
    cat "$chapter" >> "$OUTPUT_FILE"
done

# Part II: Fracture
echo "\n---\n\n# PART II: FRACTURE" >> "$OUTPUT_FILE"

for chapter in "$HOME_DIR/Part II: Fracture"/*.md; do
    echo "\n---\n" >> "$OUTPUT_FILE"
    cat "$chapter" >> "$OUTPUT_FILE"
done

# Part III: Searching
echo "\n---\n\n# PART III: SEARCHING" >> "$OUTPUT_FILE"

for chapter in "$HOME_DIR/Part III: Searching"/*.md; do
    echo "\n---\n" >> "$OUTPUT_FILE"
    cat "$chapter" >> "$OUTPUT_FILE"
done

# Part IV: Convergence
echo "\n---\n\n# PART IV: CONVERGENCE" >> "$OUTPUT_FILE"

for chapter in "$HOME_DIR/Part IV: Convergence"/*.md; do
    echo "\n---\n" >> "$OUTPUT_FILE"
    cat "$chapter" >> "$OUTPUT_FILE"
done

echo "Rebuilt $OUTPUT_FILE successfully."
