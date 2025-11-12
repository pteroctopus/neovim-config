vim.lsp.config("yamlls", {
  filetypes = { "yaml", "yaml.ansible", "yaml.docker-compose" },
  settings = {
    yaml = {
      schemas = {
        -- ["file:///Users/goran.novak/Development/github/kubeconform/scripts/crdtest.json"] = "*.x.yaml",
        -- helm unittest
        ["https://raw.githubusercontent.com/helm-unittest/helm-unittest/v0.4.1/schema/helm-testsuite.json"] = "tests/*_test.yaml",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/helmfile.json"] = "helmfile.{yml,yaml}",
        ["file:///Users/goran.novak/Development/github/CRDs-catalog/route.api.openshift.github.com/route_v1.json"] = "*route*.{yml,yaml}",

        kubernetes = {
          -- '*.yaml',
          --
          "*.kube.yml",
          "*.kube.yaml",
          "*kubectl-edit-*.yaml",
          "*role*/templates/create*.y*ml",
        },
      },
      schemaStore = {
        enable = true,
      },
      validate = true,
      completion = true,
      hover = true,
      format = {
        enable = true,
      },
    },
  },
})
