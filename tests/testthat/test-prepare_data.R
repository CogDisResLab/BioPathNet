context("prepare_data function")

test_tbl <- tibble(Name_GeneSymbol = LETTERS,
                   Value_LogDiffExp = 1:26) %>%
  arrange(desc(Value_LogDiffExp))

test_tbl_p <- tibble(Name_GeneSymbol = LETTERS,
                   Value_LogDiffExp = 1:26,
                   Significane_pvalue = 26:1) %>%
  arrange(desc(Value_LogDiffExp))

t <- list(BPNList(test_tbl), BPNList(test_tbl_p))

test_that("prepare_data works", {
  expect_equal(prepare_data(LETTERS, 1:26)@input, t[[1]]@input)
  expect_equal(prepare_data(LETTERS, 1:26, 26:1), t[[2]])
})

test_that("prepare_data gives error on incorrect input", {
  expect_error(prepare_data(LETTERS, 1:10), "genes and logfc must be of the same length")
  expect_error(prepare_data(LETTERS, ,pvalues = 1:10), "genes and logfc must be specified")
  expect_error(prepare_data(LETTERS, 1:26, 26:10), "pvalues must be the same length as genes and logfc")
  expect_error(prepare_data(LETTERS, 1:20, 26:1), "genes and logfc must be of the same length")
})

test_that("prepare_data has the correct class", {
  expect_s4_class(prepare_data(LETTERS, 1:26), "BPNList")
  expect_s4_class(prepare_data(LETTERS, 1:26, 26:1), "BPNList")
})

test_that("prepare_data sets only the input slot", {
  expect_equal(length(prepare_data(LETTERS, 1:26, 26:1)@gsea@alpha), 0)
  expect_equal(length(prepare_data(LETTERS, 1:26, 26:1)@enrichr@alpha), 0)
  expect_equal(length(prepare_data(LETTERS, 1:26, 26:1)@ilincs@threshold_pval), 0)
  expect_equal(nrow(prepare_data(LETTERS, 1:26, 26:1)@input), 26)
  expect_equal(ncol(prepare_data(LETTERS, 1:26, 26:1)@input), 3)
  expect_equal(nrow(prepare_data(LETTERS, 1:26)@input), 26)
  expect_equal(ncol(prepare_data(LETTERS, 1:26)@input), 2)
})

test_that("prepare_data sets the correct format for the input slot", {
  expect_equal(nrow(prepare_data(LETTERS, 1:26, 26:1)@input), 26)
  expect_equal(ncol(prepare_data(LETTERS, 1:26, 26:1)@input), 3)
  expect_equal(nrow(prepare_data(LETTERS, 1:26)@input), 26)
  expect_equal(ncol(prepare_data(LETTERS, 1:26)@input), 2)
  expect_named(prepare_data(LETTERS, 1:26, 26:1)@input, c("Name_GeneSymbol",  "Value_LogDiffExp", "Significane_pvalue"))
  expect_named(prepare_data(LETTERS, 1:26)@input, c("Name_GeneSymbol",  "Value_LogDiffExp"))
})
