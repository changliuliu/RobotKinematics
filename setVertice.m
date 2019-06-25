function v = setVertice(v, TransM)
v = v*TransM(1:3,1:3)' +repmat(TransM(1:3,4)',size(v,1),1);