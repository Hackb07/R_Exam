import os
from fpdf import FPDF

ROOT = r"C:\Users\balat\LAB\R"

EXPERIMENTS = [
    ("01_Basic_R_Commands", "Basic R Commands"),
    ("02_Vectors_Matrices_Dataframes_Lists", "Vectors, Matrices, Dataframes, Lists"),
    ("03_Factors_and_Importance", "Factors and their Importance"),
    ("04_CSV_File_Handling", "Create, Read, Write CSV Files & File Handling"),
    ("05_Read_CSV_Write_Updated", "Read CSV, Update, Write to New File"),
    ("06_Data_Manipulation", "Data Manipulation using Built-in Datasets"),
    ("07_Sum_Even_Product_Odd", "Sum of Even & Product of Odd Numbers"),
    ("08_Functions_in_R", "Functions in R"),
    ("09_Debugging_Coin_Toss", "Debugging Errors & Coin Toss Simulation"),
    ("10_R_RStudio_Installation", "Installing R and RStudio"),
]

def read_file(path):
    with open(path, "r", encoding="utf-8") as f:
        return f.read()

class PDF(FPDF):
    def __init__(self):
        super().__init__("P", "mm", "A4")
        self.set_auto_page_break(auto=True, margin=20)
        self.add_font("DejaVu", "", r"C:\Users\balat\LAB\R\DejaVuSansMono.ttf", uni=True)
        self.add_font("DejaVu", "B", r"C:\Users\balat\LAB\R\DejaVuSansMono-Bold.ttf", uni=True)

    def header(self):
        if self.page_no() > 1:
            self.set_font("DejaVu", "", 7)
            self.cell(0, 5, "R Programming for Data Science - Lab Experiments", align="C")
            self.ln(8)

    def footer(self):
        self.set_y(-15)
        self.set_font("DejaVu", "", 7)
        self.cell(0, 10, f"Page {self.page_no()}/{{nb}}", align="C")

    def title_page(self):
        self.add_page()
        self.ln(60)
        self.set_font("DejaVu", "B", 24)
        self.cell(0, 15, "R Programming for Data Science", align="C", new_x="LMARGIN", new_y="NEXT")
        self.ln(5)
        self.set_font("DejaVu", "", 16)
        self.cell(0, 12, "Lab Experiments Compilation", align="C", new_x="LMARGIN", new_y="NEXT")
        self.ln(20)
        self.set_font("DejaVu", "", 11)
        for i, (folder, title) in enumerate(EXPERIMENTS, 1):
            self.cell(0, 8, f"Experiment {i:2d}: {title}", align="C", new_x="LMARGIN", new_y="NEXT")
        self.ln(30)
        self.set_font("DejaVu", "", 10)
        self.cell(0, 8, "Department of Computer Science & Engineering", align="C", new_x="LMARGIN", new_y="NEXT")

    def section_heading(self, text):
        self.set_font("DejaVu", "B", 12)
        self.set_fill_color(230, 230, 240)
        self.cell(0, 8, text, fill=True, new_x="LMARGIN", new_y="NEXT")
        self.ln(2)

    def subsection(self, text):
        self.set_font("DejaVu", "B", 10)
        self.cell(0, 7, text, new_x="LMARGIN", new_y="NEXT")
        self.ln(1)

    def code_block(self, code):
        self.set_font("DejaVu", "", 8)
        self.set_fill_color(245, 245, 245)
        self.set_text_color(30, 30, 30)
        lines = code.split("\n")
        block_start = self.get_y()
        for line in lines:
            if self.get_y() > 265:
                self.add_page()
            self.cell(0, 4.2, f"  {line}", fill=True, new_x="LMARGIN", new_y="NEXT")
        self.set_text_color(0, 0, 0)
        self.ln(3)

    def body_text(self, text):
        self.set_font("DejaVu", "", 9)
        self.multi_cell(0, 5, text)
        self.ln(2)

    def add_experiment(self, num, title, readme_path, code_path):
        self.add_page()
        self.set_font("DejaVu", "B", 16)
        self.cell(0, 10, f"Experiment {num}: {title}", new_x="LMARGIN", new_y="NEXT")
        self.ln(3)

        readme = read_file(readme_path)
        code = read_file(code_path)

        # Extract sections: Aim, Algorithm, Code, Output, Result
        parts = {"Aim": "", "Algorithm": "", "Output": "", "Result": ""}
        current_section = None

        # Parse README for the sections
        for line in readme.split("\n"):
            stripped = line.strip()
            if stripped.startswith("## Aim"):
                current_section = "Aim"
                parts["Aim"] = ""
                continue
            elif stripped.startswith("## Algorithm"):
                current_section = "Algorithm"
                parts["Algorithm"] = ""
                continue
            elif stripped.startswith("## Output"):
                current_section = "Output"
                parts["Output"] = ""
                continue
            elif stripped.startswith("## Result"):
                current_section = "Result"
                parts["Result"] = ""
                continue
            elif stripped.startswith("## ") or stripped.startswith("# "):
                current_section = None

            if current_section:
                parts[current_section] += line + "\n"

        # Aim
        self.section_heading("Aim")
        aim_text = parts["Aim"].strip().strip("`").strip()
        if aim_text:
            self.body_text(aim_text)

        # Algorithm
        self.section_heading("Algorithm")
        algo_text = parts["Algorithm"]
        lines = [l for l in algo_text.split("\n") if l.strip() and not l.strip().startswith("```")]
        for l in lines:
            self.body_text(l.strip())

        # Code
        self.section_heading("R Code")
        self.code_block(code)

        # Output
        if parts["Output"].strip():
            self.section_heading("Sample Output")
            out_lines = [l for l in parts["Output"].split("\n") if l.strip() and not l.strip().startswith("```")]
            out_text = "\n".join(out_lines)
            self.code_block(out_text)

        # Result
        self.section_heading("Result")
        res_text = parts["Result"].strip().strip("`").strip()
        if res_text:
            self.body_text(res_text)


def download_fonts():
    """Download DejaVuSansMono fonts if not present."""
    import urllib.request
    fonts_dir = ROOT
    font_files = [
        ("DejaVuSansMono.ttf", "https://raw.githubusercontent.com/matplotlib/matplotlib/main/lib/matplotlib/mpl-data/fonts/ttf/DejaVuSansMono.ttf"),
        ("DejaVuSansMono-Bold.ttf", "https://raw.githubusercontent.com/matplotlib/matplotlib/main/lib/matplotlib/mpl-data/fonts/ttf/DejaVuSansMono-Bold.ttf"),
    ]
    for name, url in font_files:
        path = os.path.join(fonts_dir, name)
        if not os.path.exists(path):
            print(f"Downloading {name}...")
            urllib.request.urlretrieve(url, path)

def main():
    download_fonts()

    pdf = PDF()
    pdf.alias_nb_pages()
    pdf.title_page()

    for i, (folder, title) in enumerate(EXPERIMENTS, 1):
        readme_path = os.path.join(ROOT, folder, "README.md")
        code_path = os.path.join(ROOT, folder, "code.R")
        print(f"Adding Experiment {i}: {title}")
        pdf.add_experiment(i, title, readme_path, code_path)

    output_path = os.path.join(ROOT, "All_Experiments.pdf")
    pdf.output(output_path)
    print(f"\nPDF generated: {output_path}")

if __name__ == "__main__":
    main()
