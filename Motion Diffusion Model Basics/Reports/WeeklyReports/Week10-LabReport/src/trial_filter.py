_TRIAL_RE = re.compile(r"^SUBJ\d+_(\d+)_smpl_params$")

def get_trial_number(npz_path: Path) -> int | None:
    m = _TRIAL_RE.match(npz_path.stem)
    return int(m.group(1)) if m else None
