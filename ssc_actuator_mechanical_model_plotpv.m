% Code to plot simulation results from ssc_rot_system_stick_slip
% Copyright 2015 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
try
    figure(handle_actuator_mechanical_model)
catch
    handle_actuator_mechanical_model=figure('Name', 'actuator_mechanical_model');
end

% Generate simulation results if they don't exist
if(~exist('simlog_actuator_mechanical_model','var'))
    sim('actuator_mechanical_model_updated')
end

% Get simulation results
temp_ws=simlog_actuator_mechanical_model.Angular_Velocity_Source.w.series;
temp_as=simlog_actuator_mechanical_model.Sensor_Source.Ideal_Rotational_Motion_Sensor.A.series;
temp_ai=simlog_actuator_mechanical_model.Sensor_Inertia.Ideal_Rotational_Motion_Sensor.A.series;

% Plot results
ah(1) = subplot(2,1,1);
plot(temp_as.time,temp_as.values,'LineWidth',1)
hold on
plot(temp_ai.time,temp_ai.values,'LineWidth',1)
hold off
grid on
title('Angular Position');
ylabel('Angle (rad)');
legend({'Source','Inertia'},'Location','Best');
temp_ylimmax = max(get(gca,'YLim'));
set(gca,'YLim',[-temp_ylimmax temp_ylimmax])
ah(2) = subplot(2,1,2);
plot(temp_ws.time,temp_ws.values,'LineWidth',1)
grid on
title('Angular Velocity of Source');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');

linkaxes(ah,'x');

% Remove temporary variables
clear temp_as temp_ai temp_ws temp_ylimmax ah