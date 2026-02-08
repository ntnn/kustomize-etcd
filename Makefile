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

.PHONY: check
check: apply
	$(KUBECTL) rollout status statefulset etcd
	$(KUBECTL) exec -it etcd-0 -- etcdctl member list -wtable
	$(KUBECTL) exec -it etcd-0 -- etcdctl endpoint health --cluster
