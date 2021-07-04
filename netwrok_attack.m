%-------reading from images for training
imds=imageDatastore(strcat('C:\Users\Junaid Iqbal Khan\Documents\MATLAB\Final Year project\CNN_fast_fatigue\Data_for_fast_fatigue\Image_data'),'IncludeSubFolders',true','LabelSource','foldernames');
imdsTrain= imds;

load alexnet; 
layers = alex.Layers;
layers(23) = fullyConnectedLayer(3); % change this based on # of classes
layers(25) = classificationLayer;

ilr = 0.0001;
mxEpochs = 60;
mbSize = 9;
opts = trainingOptions('sgdm', 'InitialLearnRate', ilr, ...
    'MaxEpochs',mxEpochs , 'MiniBatchSize',mbSize, ...
    'Plots', 'training-progress');

%imdsTrain.ReadFcn = @readFunctionTrain;
myNet = trainNetwork(imdsTrain, layers, opts);
%fatigue_classifier= myNet;
%save fatigue _classifier