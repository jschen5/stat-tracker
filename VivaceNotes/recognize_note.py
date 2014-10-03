from scipy import misc
import numpy as np
import os

# PIL image modes:
#   http://svn.effbot.org/public/tags/pil-1.1.4/libImaging/Unpack.c

class NoteRecognizer:

  def __init__(self, *args, **kwargs):
    # 85 x 135 = 11475
    self.r = 85  # row dimension
    self.c = 135  # column dimension
    self.d = self.r * self.c

    self.imgs_path = 'note_images'
    self.notes_img_list = os.listdir(self.imgs_path)

    self.X = np.zeros((11475, len(self.notes_img_list)), 'float_')


  # return matrix where each column is the feature vector of a sample
  def set_samples_matrix(self):
    for note_img in self.notes_img_list:
      # True flattens image to grayscale
      # divide by 255 to normalize
      img_path = os.path.join(self.imgs_path, note_img)
      x = misc.imread(img_path, True) / 255

      # use 'F' -> PIL image mode for grayscale (ie. floating pt)
      # resize image to c x r
      x = misc.imresize(x, (self.c, self.r), mode='F')

      # flatten image to 1D array
      x = x.flatten()

      # set column to image feature vector
      i = self.notes_img_list.index(note_img)
      self.X[:, i] = x