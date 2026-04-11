all:
	@mkdir -p output
	@for f in *.ly; do \
		pdf="output/$${f%.ly}.pdf"; \
		if [ "$$f" -nt "$$pdf" ] || [ ! -f "$$pdf" ]; then \
			echo "Building $$f"; \
			lilypond -dno-point-and-click -o output "$$f"; \
		fi; \
	done

clean:
	rm -rf output
	rm -f *.pdf

.PHONY: all clean
