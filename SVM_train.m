function [pred_labels] = SVM_train(test_data, kerneltype)
    % INPUT : 
    % test_data   - m X n matrix, where m is the number of test points and n is number of features
    % kerneltype  - one of strings 'poly', 'rbf'
    %               corresponding to polynomial, and RBF kernels
    %               respectively.
    
    % OUTPUT
    % returns a m X 1 vector predicted labels for each of the test points. The labels should be +1/-1 doubles

    
    % Default code below. Fill in your code on all the relevant positions

    m = size(test_data , 1);
    n = size(test_data, 2);

    %load train_data

    datadir = 'Breast-Cancer/';

    load(strcat(datadir,'train.mat'));


%     %load cross-validation data
%     
%     % Do cross-validation
%     % For all c
%     
%     q = [1, 2, 3, 4, 5];
%     C = [1  10  10^2  10^3  10^4  10^5];
%     sigma = [0.01 1 10 10^2 10^3];
%     accMat = ones(5,6);
% %     ParamsMat = ones(5,6);
% %     CMat = ones(5,6);
%     if(strcmp(kerneltype,'poly'))
%         for i= 1:5
%             for j = 1:6
%                 accuracy = ones(5,1);
%                 for k = 1:5
%                     datadir = ['Breast-Cancer/CrossValidation/Fold',num2str(k),'/'];
%                     load(strcat(datadir,'cv-test.mat'));
%                     load(strcat(datadir,'cv-train.mat')); 
%                     input = ['-t 1 -g 1 -r 1 -d ',num2str(q(i)),' -q -c ', num2str(C(j))];
%                     model = svmtrain(cv_train(:,n), cv_train(:,1:n-1), char(input));
%                     [y_pred, ac, decv] = svmpredict(cv_test(:,n), cv_test(:,1:n-1), model,'-q');
%                     accuracy(k) = 1 - classification_error(y_pred, cv_test(:,n));
%                     clear cv_test
%                     clear cv_train
%                 end
% %                 ParamsMat(i,j) = q(i);
% %                 CMat(i,j) = C(j);
%                 accMat(i,j) = mean(accuracy);
%             end
%         end
%         accMat
%         [~,I] = max(accMat(:));
%         [I_row, I_col] = ind2sub(size(accMat),I);
%         bestC =  C(I_col);
%         bestQ =  q(I_row);
%         input = ['-t 1 -g 1 -r 1 -d ',num2str(bestQ),' -q -c ', num2str(bestC)];       
% 
%         
%     elseif(strcmp(kerneltype,'rbf'))
%          for i= 1:5
%             for j = 1:6
%                 accuracy = ones(5,1);
%                 for k = 1:5
%                     datadir = ['Breast-Cancer/CrossValidation/Fold',num2str(k),'/'];
%                     load(strcat(datadir,'cv-test.mat'));
%                     load(strcat(datadir,'cv-train.mat'));    
% 
%                     input = ['-t 2 -g ',num2str(sigma(i)),' -q -c ', num2str(C(j))];
%                     model = svmtrain(cv_train(:,n), cv_train(:,1:n-1), char(input));
%                     [y_pred, ac, decv] = svmpredict(cv_test(:,n), cv_test(:,1:n-1), model,'-q');
%                     accuracy(k) = 1 - classification_error(y_pred, cv_test(:,n));
%                     clear cv_test
%                     clear cv_train
%                 end
% %                 ParamsMat(i,j) = q(i);
% %                 CMat(i,j) = C(j);
%                 accMat(i,j) = mean(accuracy);
%             end
%          end
%          accMat
%         [~,I] = max(accMat(:));
%         [I_row, I_col] = ind2sub(size(accMat),I);
%         bestC =  C(I_col);
%         bestSigma =  sigma(I_row);
%         input = ['-t 2 -g ',num2str(bestSigma),' -q -c ', num2str(bestC)];
%         
%         
%         
%         
%     end
    
    
    
    % For all kernel parameters
    % Calculate the average cross-validation error for the 5-folds

    %your code- Did above 


    %Train SVM on training data for the best parameters
    
    if(strcmp(kerneltype,'poly'))
        input = ['-t 1 -g 1 -r 1 -d 1 -q -c 10000'];
    elseif(strcmp(kerneltype,'rbf'))
        input = ['-t 2 -g 1 -q -c 1'];
    end

    model = svmtrain(train(:,n), train(:,1:n-1), char(input));

    % Do prediction on the test data
    % pred_labels = your prediction on the test data
    % your code

    [pred_labels] = svmpredict(test_data(:,n), test_data(:,1:n-1), model,'-q');

end
