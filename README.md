# SSH MATRIX SCREENSAVER

---

<!-- TOC -->
* [SSH MATRIX SCREENSAVER](#ssh-matrix-screensaver)
  * [DESCRIPTION](#description)
  * [INSTALLATION](#installation)
  * [UNINSTALL](#uninstall)
  * [MENTIONS](#mentions)
<!-- TOC -->

---

## DESCRIPTION

A lightweight SSH idle screensaver that runs `cmatrix` in Docker after (5' default) inactivity.

---

## INSTALLATION

Run from inside the project folder:
```bash
git clone https://github.com/LeonardosZenon/ssh-matrix-screensaver.git ssh-matrix-screensaver 2>/dev/null || (cd ssh-matrix-screensaver && git pull)
./install.sh
```

---

## UNINSTALL

Run from inside the project folder:
```bash
./uninstall.sh && cd .. && rm -rf ssh-matrix-screensaver
```

---

## MENTIONS

The idea for this project came from James Spurin (Docker Captain / CNCF Ambassador / Kubestronaut). The KCNA course of 
the instructor was the inspiration of this repo.