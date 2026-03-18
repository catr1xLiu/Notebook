FRAME_TRIM = 5

def smpl_to_ntu25(params, model):
    poses = params["poses"]
    trans = params["trans"]
    if poses.shape[0] > 2 * FRAME_TRIM:
        poses = poses[FRAME_TRIM:-FRAME_TRIM]
        trans = trans[FRAME_TRIM:-FRAME_TRIM]
    # ... SMPL forward pass on trimmed data
