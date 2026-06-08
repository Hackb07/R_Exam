# Installing R and RStudio

## Table of Contents

- [Installing R](#installing-r)
  - [Windows](#windows)
  - [macOS](#macos)
  - [Linux](#linux)
- [Installing RStudio](#installing-rstudio)
- [Post-Installation Checks](#post-installation-checks)
- [Troubleshooting](#troubleshooting)

---

# Installing R

## Windows

### Method 1: CRAN Installer (Recommended)

1. Go to https://cran.r-project.org/bin/windows/base/
2. Click **"Download R-x.y.z for Windows"** (latest version)
3. Run the downloaded `.exe` installer
4. In the installer:
   - Select language → **OK**
   - **Next** through the welcome screen
   - Read license → **Next**
   - Choose installation location (default: `C:\Program Files\R\R-x.y.z`) → **Next**
   - Select components (default: all) → **Next**
   - Startup options: select **No** (use default) → **Next**
   - Start Menu folder → **Next**
   - Select additional tasks (check if desired) → **Next**
5. Click **Finish**

### Method 2: Using Chocolatey (Package Manager)

```powershell
# Install Chocolatey first (run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install R
choco install r.project
```

### Verification

```powershell
# Open Command Prompt or PowerShell and run:
"C:\Program Files\R\R-x.y.z\bin\R.exe" --version

# Or press Win+R, type: rgui
```

---

## macOS

### Method 1: CRAN Installer (Recommended)

1. Go to https://cran.r-project.org/bin/macosx/
2. Download the latest `.pkg` file (look for `R-x.y.z-arm64.pkg` for Apple Silicon M1/M2/M3, or `R-x.y.z.pkg` for Intel)
3. Open the downloaded `.pkg` file
4. Follow the installer prompts:
   - **Continue** → **Continue**
   - Read license → **Continue** → **Agree**
   - Select installation destination → **Install**
   - Enter your macOS password → **Install Software**
5. Click **Close**

### Method 2: Using Homebrew

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install R
brew install r

# For Apple Silicon (M1/M2/M3) with full optimization:
brew install --cask r
```

### Method 3: Using MacPorts

```bash
# Install MacPorts first, then:
sudo port install R
```

### Verification

```bash
# Open Terminal and run:
R --version

# Or launch R GUI from Applications
```

---

## Linux

### Ubuntu / Debian

```bash
# 1. Update package index
sudo apt update

# 2. Add CRAN repository (for latest version)
# Add the signing key
sudo apt install -y software-properties-common dirmngr
gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | sudo tee /etc/apt/trusted.gpg.d/cran.gpg

# Add repository (adjust 'noble' for your Ubuntu version: focal=20.04, jammy=22.04, noble=24.04)
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# 3. Install R
sudo apt update
sudo apt install -y r-base r-base-dev

# 4. Optional: Install common development libraries
sudo apt install -y libcurl4-openssl-dev libssl-dev libxml2-dev
```

### Fedora / RHEL / CentOS

```bash
# Fedora
sudo dnf install R R-devel

# RHEL / CentOS 7/8 (enable EPEL first)
sudo yum install epel-release
sudo yum install R R-devel

# For latest R version on RHEL/Fedora, add CRAN repo:
# Fedora 38+
sudo dnf config-manager --add-repo https://cloud.r-project.org/bin/linux/fedora
sudo dnf install R
```

### Arch Linux

```bash
sudo pacman -S r
```

### openSUSE

```bash
sudo zypper install R-base R-base-devel
```

### Verification

```bash
R --version

# Launch R interactive shell
R

# Inside R, type:
> q()
# Save workspace image? [y/n/c]: n
```

---

# Installing RStudio

RStudio requires R to be installed **first**.

## Windows

1. Go to https://posit.co/download/rstudio-desktop/
2. Click **"Download RStudio for Windows"**
3. Run the downloaded `.exe` installer
4. Follow the installation wizard:
   - **Next** → **Next**
   - Choose install location (default: `C:\Program Files\RStudio`) → **Next**
   - Select Start Menu folder → **Install**
5. Click **Finish**

## macOS

1. Go to https://posit.co/download/rstudio-desktop/
2. Click **"Download RStudio for macOS"**
   - Choose **"RStudio-x.y.z-arm64.dmg"** for Apple Silicon (M1/M2/M3)
   - Choose **"RStudio-x.y.z.dmg"** for Intel Macs
3. Open the downloaded `.dmg` file
4. Drag **RStudio** into the **Applications** folder

## Linux

### Ubuntu / Debian

```bash
# Download the latest .deb package (check for latest version at posit.co)
# Example for Ubuntu 22.04+
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.09.1-394-amd64.deb

# Install
sudo apt install -y ./rstudio-2024.09.1-394-amd64.deb

# Or for older Ubuntu versions:
# https://download1.rstudio.org/electron/focal/amd64/rstudio-2024.09.1-394-amd64.deb
```

### Fedora

```bash
# Download the .rpm package
wget https://download1.rstudio.org/electron/fedora/x86_64/rstudio-2024.09.1-394-x86_64.rpm

# Install
sudo dnf install ./rstudio-2024.09.1-394-x86_64.rpm
```

### Arch Linux

```bash
# From AUR (using yay or paru)
yay -S rstudio-desktop-bin
# or
paru -S rstudio-desktop-bin
```

---

# Post-Installation Checks

## Verify both installations

```r
# Open RStudio and run in the Console:
version
cat("R is working!\n")

# Install a test package
install.packages("ggplot2")
library(ggplot2)
cat("ggplot2 installed successfully!\n")

# Test with mtcars
data(mtcars)
summary(mtcars)
```

## Install commonly used Data Science packages

```r
install.packages(c("dplyr", "tidyr", "ggplot2", "caret",
                   "randomForest", "e1071", "corrplot",
                   "rmarkdown", "shiny", "plotly"))
```

## Set CRAN mirror (if prompted)

```r
# During install.packages(), select a mirror near you
# Or set it permanently:
chooseCRANmirror()
# or
options(repos = c(CRAN = "https://cloud.r-project.org"))
```

---

# Troubleshooting

| Issue | Solution |
|-------|----------|
| **"R is not recognized" (Windows)** | Add R to PATH: `C:\Program Files\R\R-x.y.z\bin` |
| **RStudio cannot find R** | Reinstall R, then RStudio; or point RStudio to R manually in Global Options |
| **Permission denied (Linux)** | Use `sudo` or install R/RStudio as root |
| **Missing system dependencies (Linux)** | `sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev` |
| **Apple Silicon package issues** | Ensure you downloaded the **arm64** version of both R and RStudio |
| **Homebrew R not found** | Run `brew link --overwrite r` or `eval "$(/opt/homebrew/bin/brew shellenv)"` |
| **Package installation fails** | Install system dependencies first (especially gfortran, libxml2, libcurl) |

---

> **Tip:** Always install R **before** RStudio. RStudio is an IDE that depends on an existing R installation.
