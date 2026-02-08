KUBECTL ?= kubectl
KUSTOMIZE ?= $(KUBECTL) kustomize

.PHONY: dry
dry:
	$(KUSTOMIZE) .

.PHONY: apply
apply:
	$(KUSTOMIZE) . | $(KUBECTL) apply -f-

.PHONY: delete
delete:
	$(KUSTOMIZE) . | $(KUBECTL) delete -f- --ignore-not-found=true
	$(KUBECTL) delete pvc -l app=etcd
