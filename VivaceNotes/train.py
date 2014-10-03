from recognize_note import NoteRecognizer

rn = NoteRecognizer()
rn.set_samples_matrix()

print rn.X.shape