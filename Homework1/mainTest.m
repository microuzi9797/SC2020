function output=mainTest(inputFile, outputFile)

if nargin<1, inputFile='input.txt'; end
if nargin<2, outputFile='output.matlab.txt'; end

% Read input file
fprintf('Reading input file "%s"...\n', inputFile);
output=[]; id=1;
fidInput=fopen(inputFile, 'r');
if fidInput<0, error('Cannot open input file "%s"!', inputFile); end
while ~feof(fidInput)
	mA_size = str2num(fgetl(fidInput));
	mA_value = str2num(fgetl(fidInput));
	mB_size = str2num(fgetl(fidInput));
	mB_value = str2num(fgetl(fidInput));
	mA = reshape(mA_value, fliplr(mA_size))';
	mB = reshape(mB_value, fliplr(mB_size))';
	output(id)=addAndMax(mA, mB); id=id+1;
%	keyboard
end
fclose(fidInput);

% Write output file
fprintf('Writing output file "%s"...\n', outputFile);
fidOutput=fopen(outputFile, 'w');
if fidOutput<0, error('Cannot open output file "%s"!', outputFile); end
for i=1:length(output)
	fprintf(fidOutput, '%.1f\n', output(i));
end
fclose(fidOutput);