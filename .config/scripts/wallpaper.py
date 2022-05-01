import argparse
import os
from PIL import Image
from typing import List

parser = argparse.ArgumentParser(description='Process an image to fit 1080 and 1440p monitors')
parser.add_argument('image_path', metavar='path', type=str)

args = parser.parse_args()
path: str = args.image_path

if not os.path.exists(path):
    print('Invalid path!')
    exit(1)

new_file: List[str] = path.split('/')[-1].split('.')
new_file[-2] = new_file[-2] + '-test'
new_file: str = '.'.join(new_file)

new_path: str = '/'.join(path.split('/')[:-1]) + '/' + new_file

img = Image.open(path)

img = img.resize((4480, 1440))

left_crop = img.crop((0, 0, 1920, 1440))
left_crop = left_crop.resize((1920, 1080))
right_crop = img.crop((1920, 0, 4480, 1440))

output = Image.new('RGB', (4480, 1440), (0, 0, 0))

output.paste(left_crop)
output.paste(right_crop, (1920, 0, 4480, 1440))

output.save(new_path)

os.system('feh --bg-max --no-xinerama ' + new_path)
os.system(f'wal -i {new_path} -n')
