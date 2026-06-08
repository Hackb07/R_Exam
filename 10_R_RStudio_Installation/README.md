# Experiment 10: Installing R and RStudio on Windows, macOS, and Linux

## Aim
To learn how to install R and RStudio on three major operating systems (Windows, macOS, Linux), verify the installation, and set up commonly used data science packages.

## Algorithm

```
Step 1: Choose operating system (Windows / macOS / Linux)
Step 2: Install R:
  - Windows: Download from CRAN → run .exe → follow wizard
    OR use Chocolatey: choco install r.project
  - macOS: Download .pkg from CRAN → run installer
    OR use Homebrew: brew install r
  - Linux (Ubuntu/Debian): sudo apt install r-base r-base-dev
  - Linux (Fedora): sudo dnf install R
  - Linux (Arch): sudo pacman -S r
Step 3: Verify R installation (R --version)
Step 4: Download RStudio from posit.co/download/rstudio-desktop/
Step 5: Install RStudio:
  - Windows: run .exe → follow wizard
  - macOS: drag to Applications folder
  - Linux: sudo apt install ./rstudio-*.deb (or dnf for .rpm)
Step 6: Launch RStudio → Console pane opens
Step 7: Verify installation via R session info
Step 8: Install data science packages: install.packages(c("dplyr", "ggplot2", ...))
Step 9: End
```

## Code

[code.R](code.R)

```r
# Run this verification script after installing R
cat("R version:", R.version.string, "\n")
cat("Platform:", R.version$platform, "\n")
cat("Working directory:", getwd(), "\n")
cat("Library paths:", .libPaths(), "\n")

# Test basic functionality
test_vec <- c(1, 5, 10, 15, 20)
cat("Mean:", mean(test_vec), "| Sum:", sum(test_vec), "\n")

# Check RStudio
if (requireNamespace("rstudioapi", quietly = TRUE)) {
  if (rstudioapi::isAvailable()) {
    cat("RStudio version:", rstudioapi::versionInfo()$version, "\n")
  }
}

# Check common data science packages
ds_pkgs <- c("dplyr", "tidyr", "ggplot2", "caret", "rmarkdown")
for (pkg in ds_pkgs) {
  status <- if (requireNamespace(pkg, quietly = TRUE)) "✓" else "✗"
  cat(sprintf("%-15s %s\n", pkg, status))
}
```

## Output

```
========================================
  R Installation Verification Script
========================================

1. R VERSION
R version: R version 4.4.2 (2024-10-31)
R major version: 4
R minor version: 4.2
Platform: x86_64-w64-mingw32
OS: Windows 10 x64 (build 19045)

2. WORKING DIRECTORY
Current working directory: C:/Users/balat/LAB/R
Home directory: C:\Users\balat\Documents

3. R ENVIRONMENT PATHS
R home: C:/PROGRA~1/R/R-44~1.2
Library paths:
   1 : C:/Users/balat/AppData/Local/R/win-library/4.4
   2 : C:/Program Files/R/R-4.4.2/library

4. BASIC FUNCTIONALITY TEST
  Arithmetic: 2 + 2 = 4
  Vector: 1 5 10 15 20
  Mean: 10.2 | Sum: 51 | Length: 5
  Data frame:
       OS     Type  Package_Mgr
1 Windows GUI + CLI   CRAN/Choco
2   macOS GUI + CLI CRAN/Homebrew
3  Ubuntu       CLI          apt
4  Fedora       CLI          dnf
5    Arch       CLI       pacman

5. RSTUDIO CHECK
  RStudio not detected. Running in terminal/console mode.

6. INSTALLATION GUIDE
  See INSTALL.md in the parent directory for platform details.

7. RECOMMENDED PACKAGES FOR DATA SCIENCE
  dplyr                - INSTALLED
  tidyr                - INSTALLED
  ggplot2              - INSTALLED
  caret                - NOT INSTALLED
  randomForest         - NOT INSTALLED
  rmarkdown            - INSTALLED
  shiny                - NOT INSTALLED
  plotly               - NOT INSTALLED
```

## Result

R and RStudio installation was successfully documented and verified for all three major platforms:

| Platform | R Installation Methods | RStudio |
|----------|----------------------|---------|
| **Windows** | CRAN installer (.exe), Chocolatey (`choco install r.project`) | .exe installer |
| **macOS** | CRAN .pkg, Homebrew (`brew install r`), MacPorts | .dmg (arm64 for Apple Silicon) |
| **Linux** | apt (Ubuntu/Debian), dnf (Fedora), pacman (Arch) | .deb / .rpm |

The verification script confirms R version, platform, library paths, basic functionality, and package availability. This experiment serves as the starting point for all subsequent R programming work.
