% calculate base data
T=0:.5:10;
T=T';
B=sin(T);
N=21;

% initialize array to store optimization results
CT=5;
AMPS = [(1:CT)];

% loop jsbatch runs
for i=1:CT

  % add noise to base data
  R=rand(N,1)-.5;
  D=B+R*.3;

  % write JSim columnar data
  fp=fopen('rbase.cdata', 'w');
  fprintf(fp, 't u\n');
  for j=1:21
    fprintf(fp, '%g %g\n', T(j,1), D(j,1));
  end
  fclose(fp);

  % call JSim
  CMD='jsbatch -f monte1.proj -rm data_1 -f rbase.cdata -optim -o amp -ofmt pretty';
  [stat,txt]=unix(CMD);
  [tok,txt]=strtok(txt);
  tok=strtok(txt);
  JSIM_RESULT=str2double(tok)
  AMPS(i)=JSIM_RESULT;
end

% show results, mean/variance
AMPS=AMPS
MEAN=mean(AMPS)
VARIANCE=var(AMPS)
