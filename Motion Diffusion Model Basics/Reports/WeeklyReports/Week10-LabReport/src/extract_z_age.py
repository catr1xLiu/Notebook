# Extraction pathway (from extract_z_age.py):
features = model.backbone(keypoint)         # (B*NC, M, 256, T', V)
z_clips  = model.head.get_z(features)       # (B*NC, 32)
z_age    = z_clips.view(B, NC, -1).mean(1)  # (B, 32) — averaged over 10 clips
