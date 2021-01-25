function [ u ] = pd_controller(~, s,s_des, params)
%PD_CONTROLLER  PD controller for the height
%
%   s: 2x1 vector containing the current state [z; v_z]
%   s_des: 2x1 vector containing desired state [z; v_z]
%   params: robot parameters

kp= 170;
kv= 20;
ep= s_des(1)-s(1);
ev= s_des(2)-s(2);
u = params.mass*(9.65+kv*ev+ep*kp+params.mass);


% FILL IN YOUR CODE HERE


end

