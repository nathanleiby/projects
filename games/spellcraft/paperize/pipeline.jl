print("Prepare combined/ directory")

run(`rm -rf combined/`)
run(`mkdir -p combined/`)

input_dir = "images"
output_dir = "combined"
images = readdir(input_dir)
print(images)

# TODO: Support > 69 cards, eventually
# pages = partition(cropped_files, 69)

# rows of 10
rows = collect(Iterators.partition(images, 10))
for (idx, row) in enumerate(rows)
    println(row)
    inputs = map(x -> "$(input_dir)/$(x)", row)
    # append horizontally
    cmd = `convert $(inputs) +append combined/combined-$(idx).png`
    run(cmd)
end

combined_files = readdir("combined")
inputs = map(x -> "combined/$(x)", combined_files)
# append vertically
cmd = `convert $(inputs) -append $(output_dir)/deck.png`
run(cmd)
