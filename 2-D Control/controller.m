function [ u1, u2 ] = controller(~, state, des_state, params)
%CONTROLLER  Controller for the planar quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [y; z], state.vel = [y_dot; z_dot], state.rot = [phi],
%   state.omega = [phi_dot]
%
%   des_state: The desired states are:
%   des_state.pos = [y; z], des_state.vel = [y_dot; z_dot], des_state.acc =
%   [y_ddot; z_ddot]
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls
z_T_dot_dot = des_state.acc(2);
phi_c_dot_dot = 0;
phi_c_dot = 0;
y_T_dot_dot = des_state.acc(1);

phi_dot = state.omega;
phi = state.rot;
y_T_dot= des_state.vel(1);
y_dot = state.vel(1);
y_T = des_state.pos(1);
y = state.pos(1);
z_T_dot = des_state.vel(2);
z_dot = state.vel(2);
z_T = des_state.pos(2);
z  =  state.pos(2);

m = params.mass;
g = params.gravity;


kp_y = 23;
kv_y = 3;
kp_z = 80;
kv_z = 22;
kp_phi = 980;
kv_phi = 12;

u1 = params.mass*(g+des_state.acc(2)+kv_z*(des_state.vel(2)-state.vel(2))+kp_z*(des_state.pos(2)-state.pos(2))) ;
phi_c = -(1/g)*(y_T_dot_dot+kv_y*(y_T_dot-y_dot)+kp_y*(y_T-y)) ;
u2 = params.Ixx*(phi_c_dot_dot+kv_phi*(phi_c_dot-phi_dot)+kp_phi*(phi_c-phi)) ;


end

