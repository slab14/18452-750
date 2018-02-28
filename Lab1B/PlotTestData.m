clc; clear; close all;

[filename,pathname] = uigetfile('*.dat');
csi_trace = read_bf_file(fullfile(pathname,filename));

T0 = csi_trace{1}.timestamp_low;

CarrierIndex = 5;

for i = 1:size(csi_trace,1)
    if(~isempty(csi_trace{i}))
        csi = get_scaled_csi(csi_trace{i});
        csi_db = db(abs(squeeze(csi).'));
        csi_single_carrier(i) = csi_db(CarrierIndex);
    end
end

figure;plot(csi_single_carrier,'linewidth',2);grid on;
title(['CSI for carrier ',num2str(CarrierIndex)]);
xlabel('Packet index');
ylabel('SNR [dB]');
set(gca,'fontsize',14);


figure;
for i = 1:1:12
    csi = get_scaled_csi(csi_trace{i});
    subplot(3,4,i); plot(db(abs(squeeze(csi).')));grid on;
    title(['Time ',num2str(csi_trace{i}.timestamp_low-T0),' sec']);
    xlabel('Subcarrier index');
    ylabel('SNR [dB]');
    %set(gca,'fontsize',14);

end
