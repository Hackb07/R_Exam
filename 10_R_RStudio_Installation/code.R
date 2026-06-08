# ============================================================
# Experiment 10: Installing R and RStudio
# ============================================================
# This script verifies the R installation and tests basic
# functionality after setup. Run this after installing R.

cat("========================================\n")
cat("  R Installation Verification Script\n")
cat("========================================\n\n")

# ---- 1. R Version ----
cat("1. R VERSION\n")
cat("R version:", R.version.string, "\n")
cat("R major version:", R.version$major, "\n")
cat("R minor version:", R.version$minor, "\n")
cat("Platform:", R.version$platform, "\n")
cat("OS:", sessionInfo()$running, "\n\n")

# ---- 2. Working Directory ----
cat("2. WORKING DIRECTORY\n")
cat("Current working directory:", getwd(), "\n")
cat("Home directory:", path.expand("~"), "\n\n")

# ---- 3. Environment Paths ----
cat("3. R ENVIRONMENT PATHS\n")
cat("R home:", R.home(), "\n")
cat("Library paths:\n")
lib_paths <- .libPaths()
for (i in seq_along(lib_paths)) {
  cat("  ", i, ":", lib_paths[i], "\n")
}
cat("\n")

# ---- 4. Basic R Functionality Test ----
cat("4. BASIC FUNCTIONALITY TEST\n")

# Arithmetic
cat("  Arithmetic: 2 + 2 =", 2 + 2, "\n")

# Create data
test_vec <- c(1, 5, 10, 15, 20)
cat("  Vector:", test_vec, "\n")
cat("  Mean:", mean(test_vec), "| Sum:", sum(test_vec),
    "| Length:", length(test_vec), "\n")

# Data frame
test_df <- data.frame(
  OS = c("Windows", "macOS", "Ubuntu", "Fedora", "Arch"),
  Type = c("GUI + CLI", "GUI + CLI", "CLI", "CLI", "CLI"),
  Package_Mgr = c("CRAN/Choco", "CRAN/Homebrew", "apt", "dnf", "pacman")
)
cat("  Data frame:\n")
print(test_df)

#---- 5. Check RStudio (if available) ----
cat("5. RSTUDIO CHECK\n")
if (requireNamespace("rstudioapi", quietly = TRUE)) {
  if (rstudioapi::isAvailable()) {
    cat("  RStudio version:", rstudioapi::versionInfo()$version, "\n")
    cat("  RStudio is running!\n")
  } else {
    cat("  RStudio API available but not running in RStudio.\n")
  }
} else {
  cat("  RStudio not detected. Running in terminal/console mode.\n")
}
cat("\n")

# ---- 6. Installation Guide Reference ----
cat("6. INSTALLATION GUIDE\n")
cat("  See INSTALL.md in the parent directory for:\n")
cat("  - Windows: CRAN installer or Chocolatey\n")
cat("  - macOS: CRAN .pkg, Homebrew, or MacPorts\n")
cat("  - Linux: apt (Debian/Ubuntu), dnf (Fedora), pacman (Arch)\n")
cat("  - RStudio Desktop for all platforms\n")
cat("  - Post-installation checks and troubleshooting\n\n")

# ---- 7. Recommended Data Science Packages ----
cat("7. RECOMMENDED PACKAGES FOR DATA SCIENCE\n")
ds_pkgs <- c("dplyr", "tidyr", "ggplot2", "caret",
             "randomForest", "e1071", "corrplot",
             "rmarkdown", "shiny", "plotly")
cat("  Core packages to install:\n")
for (pkg in ds_pkgs) {
  installed <- requireNamespace(pkg, quietly = TRUE)
  status <- if (installed) "INSTALLED" else "NOT INSTALLED"
  cat("  ", sprintf("%-20s", pkg), "-", status, "\n")
}

cat("\n  To install missing packages:\n")
cat('  install.packages(c("dplyr", "tidyr", "ggplot2", ...))\n\n')

cat("========================================\n")
cat("  Installation verification complete!\n")
cat("========================================\n")
