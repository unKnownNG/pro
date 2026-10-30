"""
Test Runner: Executes all 14 AI Lab Experiments in Python
"""
import subprocess
import sys
from pathlib import Path

def run_experiment(script_path):
    print("\n" + "#" * 70)
    print(f"RUNNING: {script_path.name}")
    print("#" * 70)
    res = subprocess.run([sys.executable, str(script_path)], capture_output=True, text=True)
    if res.stdout:
        print(res.stdout)
    if res.stderr:
        print("ERROR:", res.stderr)
    return res.returncode == 0

def main():
    py_dir = Path(__file__).parent / "python"
    scripts = sorted(py_dir.glob("ex*.py"))
    
    print(f"Found {len(scripts)} Python experiment scripts to run.")
    passed = 0
    for s in scripts:
        ok = run_experiment(s)
        if ok:
            passed += 1

    print("\n" + "=" * 70)
    print(f"SUMMARY: {passed}/{len(scripts)} experiments ran successfully!")
    print("=" * 70)

if __name__ == "__main__":
    main()
