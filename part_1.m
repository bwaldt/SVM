    q = [1, 2, 3, 4, 5];
    C = [1  10  10^2  10^3  10^4  10^5];
    accMat = ones(5,5);
    for i= 1:5
        for j = 1:5
            accuracy = ones(5,1);
            for k = 1:5
                datadir = ['Synthetic/CrossValidation/Fold',num2str(k),'/'];

                load(strcat(datadir,'cv-test.mat'));
                load(strcat(datadir,'cv-train.mat'));    

                input = ['-t 1 -g 1 -r 1 -d ',num2str(q(i)),' -q -c ', num2str(C(j))];
                model = svmtrain(cv_train(:,3), cv_train(:,1:2), input);
                [pred, ac, decv] = svmpredict(cv_test(:,3), cv_test(:,1:2), model,'-q');
                accuracy(k) = ac(1);
            end
            accMat(i,j) = mean(accuracy);
        end
    end