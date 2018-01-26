%Trees%
X1 = Feature_Extraction('dataset\tree1.jpg');
X1 = [X1 1];
X2 = Feature_Extraction('dataset\tree2.jpg');
X2 = [X2 1];
X3 = Feature_Extraction('dataset\tree3.jpg');
X3 = [X3 1];
X4 = Feature_Extraction('dataset\tree4.jpg');
X4 = [X4 1];
X5 = Feature_Extraction('dataset\tree5.jpg');
X5 = [X5 1];

%Pens%
Y1 = Feature_Extraction('dataset\pen1.jpg');
Y1 = [Y1 2];
Y2 = Feature_Extraction('dataset\pen2.jpg');
Y2 = [Y2 2];
Y3 = Feature_Extraction('dataset\pen3.jpg');
Y3 = [Y3 2];
Y4 = Feature_Extraction('dataset\pen4.jpg');
Y4 = [Y4 2];
Y5 = Feature_Extraction('dataset\pen5.jpg');
Y5 = [Y5 2];

V = [X1;X2;X3;X4;X5;Y1;Y2;Y3;Y4;Y5];
k = round(sqrt(size(V,1)));

%Unknown patterns%
P1 = Feature_Extraction('dataset\unknown1.jpg');
class = KNN_Classifier(V,P1,k);
display(class);

P2 = Feature_Extraction('dataset\unknown2.jpg');
class = KNN_Classifier(V,P2,k);
display(class);

P3 = Feature_Extraction('dataset\unknown3.jpg');
class = KNN_Classifier(V,P3,k);
display(class);

P4 = Feature_Extraction('dataset\unknown4.jpg');
class = KNN_Classifier(V,P4,k);
display(class);
