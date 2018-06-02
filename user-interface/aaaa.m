function varargout = aaaa(varargin)
% AAAA MATLAB code for aaaa.fig
%      AAAA, by itself, creates a new AAAA or raises the existing
%      singleton*.
%
%      H = AAAA returns the handle to a new AAAA or the handle to
%      the existing singleton*.
%
%      AAAA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AAAA.M with the given input arguments.
%
%      AAAA('Property','Value',...) creates a new AAAA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aaaa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aaaa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aaaa

% Last Modified by GUIDE v2.5 06-Jun-2015 10:26:49

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aaaa_OpeningFcn, ...
                   'gui_OutputFcn',  @aaaa_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
    global p
    global pp
end
% End initialization code - DO NOT EDIT


% --- Executes just before aaaa is made visible.
function aaaa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aaaa (see VARARGIN)
set(hObject,'WindowButtonDownFcn',{@my_MouseClickFcn,hObject});
set(hObject,'WindowButtonUpFcn',{@my_MouseReleaseFcn,hObject});
axes(handles.axes2);
axes(handles.axes1);
set(handles.axes2,'xlim',[0 28],'ylim',[0 28]);
set(handles.axes1,'xlim',[0 28],'ylim',[0 28]);
% Choose default command line output for aaaa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aaaa wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function my_MouseClickFcn(obj,event,hObject)
handles=guidata(hObject);
currPt = get(gca, 'CurrentPoint');
Pt1 = currPt(1,1)
Pt2 = currPt(1,2)
line(Pt1, Pt2,'Marker','.','LineStyle','-' );
set(handles.figure1,'WindowButtonMotionFcn',{@my_MouseMoveFcn,hObject});
guidata(hObject,handles)

function my_MouseReleaseFcn(obj,event,hObject)
handles=guidata(hObject);
set(handles.figure1,'WindowButtonMotionFcn','');

function my_MouseMoveFcn(obj,event,hObject)
handles=guidata(hObject);
%mousepos2=get(handles.axes2,'CurrentPoint');
currPt = get(gca, 'CurrentPoint');
pt1 = currPt(1,1);
pt2 = currPt(1,2);
line(pt1,pt2,'Marker','o','LineWidth',10 );

% --- Outputs from this function are returned to the command line.
function varargout = aaaa_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plus.
function plus_Callback(hObject, eventdata, handles)
% hObject    handle to plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = p + pp;
set(handles.result3,'String',answer);


% --- Executes on button press in minus.
function minus_Callback(hObject, eventdata, handles)
% hObject    handle to minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = p - pp;
set(handles.result3,'String',answer);

% --- Executes on button press in multy.
function multy_Callback(hObject, eventdata, handles)
% hObject    handle to multy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = p * pp;
set(handles.result3,'String',answer);

% --- Executes on button press in divide.
function divide_Callback(hObject, eventdata, handles)
% hObject    handle to divide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = p / pp;
set(handles.result3,'String',answer);

% --- Executes on button press in root.
function root_Callback(hObject, eventdata, handles)
% hObject    handle to root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = nthroot(p, pp);
set(handles.result3,'String',answer);


% --- Executes on button press in power.
function power_Callback(hObject, eventdata, handles)
% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = power(p, pp);
set(handles.result3,'String',answer);

% --- Executes on button press in c.
function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global pp
answer = nchoosek(p, pp);
set(handles.result3,'String',answer);


% --- Executes on button press in rec1.
function rec1_Callback(hObject, eventdata, handles)
% hObject    handle to rec1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load all_theta;
all_theta = evalin('base', 'all_theta');
%i = getframe;
i = getframe(handles.axes1);
y = i.cdata;
%y = i.cdata;
%figure;
%imshow(y);
g = rgb2gray(y);

img = im2double(g);

res = imresize(img,[20 20]);

res = reshape(res,1,400);

%standardize
res = imcomplement(res);
mu = mean(res);
res = (res - mu)./std(res);

resshow = reshape(res,20,20);
%show 
axes(handles.preview1);
imshow(resshow);

res = [1 res];
global p
BB = all_theta*res';
[a,p] = max(BB, [], 1);
if p == 10
    p = 0
end

assignin('base','p',p);
assignin('base','BB',BB);

set(handles.result1, 'String', p);





% --- Executes on button press in rec2.
function rec2_Callback(hObject, eventdata, handles)
% hObject    handle to rec2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load all_theta;
all_theta = evalin('base', 'all_theta');

%i = getframe;
i = getframe(handles.axes2);
y = i.cdata;
%y = i.cdata;
%figure;
%imshow(y);
g = rgb2gray(y);

img = im2double(g);

res = imresize(img,[20 20]);

res = reshape(res,1,400);

%standardize
res = imcomplement(res);
mu = mean(res);
res = (res - mu)./std(res);

resshow = reshape(res,20,20);
%show 
axes(handles.preview2);
imshow(resshow);

res = [1 res];
global pp
BB = all_theta*res';
[a,pp] = max(BB, [], 1);

if pp == 10
    pp = 0
end

assignin('base','pp',pp);
assignin('base','BB',BB);

set(handles.result2, 'String', pp);

% --- Executes on button press in try1.
function try1_Callback(hObject, eventdata, handles)
% hObject    handle to try1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k = get(handles.input1, 'String');
k = str2num(k);
X = evalin('base', 'X');
y = evalin('base', 'y');
i = getframe(handles.axes1)
c = i.cdata;
g = rgb2gray(c);
img = im2double(g);
res = imresize(img,[20 20]);
res = reshape(res,1,400);
%sta ndardize
res = imcomplement(res);
mu = mean(res);
res = (res - mu)./std(res);

[m n] = size(X);

times = get(handles.times1, 'String');
times = str2num(times);

for i = 1:times
    X = [X ; res];
    y = [y ; k];
end


mytrain
assignin('base','X',X);
assignin('base','y',y);
assignin('base','all_theta',all_theta);




% --- Executes on button press in try2.
function try2_Callback(hObject, eventdata, handles)
% hObject    handle to try2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k = get(handles.input2, 'String');
k = str2num(k);
X = evalin('base', 'X');
y = evalin('base', 'y');
i = getframe(handles.axes2)
c = i.cdata;
g = rgb2gray(c);
img = im2double(g);
res = imresize(img,[20 20]);
res = reshape(res,1,400);
%sta ndardize
res = imcomplement(res);
mu = mean(res);
res = (res - mu)./std(res);

[m n] = size(X);

times = get(handles.times2, 'String');
times = str2num(times);

for i = 1:times
    X = [X ; res];
    y = [y ; k];
end


mytrain
assignin('base','X',X);
assignin('base','y',y);
assignin('base','all_theta',all_theta);



% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla(handles.axes1);
cla(handles.axes2);
set(handles.result1, 'String', '');
set(handles.result2, 'String', '');
set(handles.result3, 'String', '');
set(handles.input1, 'String', '');
set(handles.input2, 'String', '');
%set(handles.times1, 'String', '');
%set(handles.times2, 'String', '');
cla(handles.preview1);
cla(handles.preview2);

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
clearStr = 'clear all';
evalin('base',clearStr);
close(aaaa);
%delete(handles.figureExitButton);


% --- Executes on button press in wq.
function wq_Callback(hObject, eventdata, handles)
% hObject    handle to wq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

evalin('base', 'save(''mydigit.mat'', ''X'', ''y'', ''all_theta'')');

clc;
clearStr = 'clear all';
evalin('base',clearStr);

close(aaaa);


%% 不知所云不知所云不知所云不知所云不知所云不知所云不知所云不知所云不知所云不知所云
function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double

% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double

% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function times2_Callback(hObject, eventdata, handles)
% hObject    handle to times2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of times2 as text
%        str2double(get(hObject,'String')) returns contents of times2 as a double


% --- Executes during object creation, after setting all properties.
function times2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to times2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function times1_Callback(hObject, eventdata, handles)
% hObject    handle to times1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of times1 as text
%        str2double(get(hObject,'String')) returns contents of times1 as a double


% --- Executes during object creation, after setting all properties.
function times1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to times1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
