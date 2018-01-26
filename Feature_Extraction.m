function [ vector ] = Feature_Extraction( path )

%Convert image to binary image
img = imread(path);
img = im2bw(img);
img = 1 - img;

%Get size of image (rows and columns)
ImgSize = size(img);

%Initialize length , width , sum of x-coordinate , sum of y-coordinate,
%number of pixels in the object, area, perimeter , and flag to 0
length = 0;
width = 0;
SumX = 0;
SumY = 0;
count = 0;
flag = 0;
area = 0;
perimeter = 0;

%Calculate width , length , area , perimeter , and centroid of the object in the image
for i=1:ImgSize(1,1)
    Prewidth = width;
    width = 0;
   for j=1:ImgSize(1,2)
       if img(i,j)
           SumX = SumX + i;
           SumY = SumY + j;
           count = count + 1;
           if ~flag 
               length = length + 1;
               flag = ~flag;
           end
           width = width + 1;
           %Area is sum of pixels
           area = area + 1;
           %A pixel is part of the perimeter if it is nonzero and it is connected to at least one zero-valued pixel
           if ~img(i-1,j) || ~img(i+1,j) || ~img(i,j-1) || ~img(i,j+1)
                perimeter =  perimeter + 1;
           end
       end
   end
   if width < Prewidth
       width = Prewidth;
   end
   if flag
       flag = ~flag;
   end
end

%Calculate circularity ratio
circularity = (4 * pi * area)/(perimeter ^ 2);

%Centroid
centroid = [ round(SumX / count) , round(SumY / count)];

%Display  width , length , area , perimeter , circularity , and centroid in the command window
display(width),display(length),display(centroid),display(area),display(perimeter),display(circularity);

%Save  width , length , area , perimeter , circularity , and centroid in a vector
vector = [ width , length , centroid , area , perimeter , circularity ];
end

