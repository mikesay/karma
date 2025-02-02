include make/vars.mk
include make/go.mk
include make/cc.mk
include make/docker.mk
include make/lint-versions.mk

.PHONY: lint
lint: lint-go lint-bootstrap-version
	make -C ui lint-js

.PHONY: test
test: lint
	make test-go
	make -C ui test-js

.PHONY: clean
clean:
	rm -fr $(NAME) $(NAME)-* ui/build ui/build.pre ui/node_modules ui/coverage ui/e2e/node_modules coverage.txt

.PHONY: show-version
show-version:
	@echo $(VERSION)
