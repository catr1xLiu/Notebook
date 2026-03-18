for i, subject_id in enumerate(subject_ids):
    if (i % 4) == 3:  # indices 3, 7, 11, ...
        val_subjects.add(subject_id)
    else:
        train_subjects.add(subject_id)
