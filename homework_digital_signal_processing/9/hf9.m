[img]=imread('boat_noisy.png'); 
img_matrix = double(rgb2gray(img))/256;

new_image = conv2(img_matrix, fspecial('average'));
edge_image = conv2(new_image, fspecial('log'));

figure(1)

subplot(311)
imshow(img_matrix)
subplot(312)
imshow(new_image);
subplot(313)
imshow(edge_image);