% Copyright 2017 Tim Grunert, Christian Schade, Lars Brandes, Sven Fielsch,
% Claudia Michalik, Matthias Stursberg
%
% This file is part of ODESCA.
% 
% ODESCA is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published 
% by the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% ODESCA is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Lesser General Public License
% along with ODESCA.  If not, see <http://www.gnu.org/licenses/>.

classdef TestSimple < ODESCA_Component
    %ODESCA_SteadyStateTest_Component Class for the test of ODESCA_SteadyState
    %
    % DESCRIPTION
    %   This class is used for the tests of the ODESCA_SteadyState class.
    %
    %
    % PROPERTIES:
    %
    %
    % CONSTRUCTOR:
    %   obj = ODESCA_SteadyStateTest_Component()
    %
    % METHODS:
    %
    % LISTENERS
    %
    % NOTE:
    %   - It is possible to have components without states, inputs or
    %     parameters.
    %   - Every component has to have at least one output.
    %
    % SEE ALSO
    %
    
    properties
    end
    
    methods
        function obj = TestSimple(name)
            % Constructor of the component
            %
            % SYNTAX
            %   obj = ODESCA_Component_Template();
            %
            % INPUT ARGUMENTS
            %
            % OPTIONAL INPUT ARGUMENTS
            %
            % OUTPUT ARGUMENTS
            %   obj: new instance of the class
            %
            % DESCRIPTION
            %   In the constructor the construction parameters needed for
            %   the calculation of the equations have to be specified.
            %
            % NOTE
            %
            % SEE ALSO
            %
            % EXAMPLE
            %
            
            % Set the name if a name was given
            if( nargin == 1 )
                obj.setName(name);
            end
            
            % ---- Instruction ----
            % Define the construction parameters which are needed for the
            % creation of the equations by filling in the names of the
            % construction parameters in the array below. If you don't want
            % to have construction parameters just leave the array empty.
            %
            % NOTE: To access the construction parameter in the sections
            % below use the command:
            %       obj.constructionParam.PARAMETERNAME
            %==============================================================
            %% DEFINITION OF CONSTRUCTION PARAMETERS (User Editable)
            %==============================================================          
            
            constructionParamNames = {};
            
            %==============================================================
            %% Template Code
            obj.addConstructionParameter(constructionParamNames);
            if(isempty(constructionParamNames))
                obj.tryCalculateEquations();
            end 
        end
    end
    
    methods(Access = protected)
        function calculateEquations(obj)
            % Calculates the equations of the component
            %
            % SYNTAX
            %
            % INPUT ARGUMENTS
            %   obj:    Instance of the object where the methode was
            %           called. This parameter is given automatically.
            %
            % OPTIONAL INPUT ARGUMENTS
            %
            % OUTPUT ARGUMENTS
            %
            % DESCRIPTION
            %   In this method the states, inputs, outputs and parameters
            %   are defined and the equations of the component are
            %   calculated.
            %
            % NOTE
            %   - This method is called by the method
            %     tryCalculateEquations() to avoid a call if not all
            %     construction parameters are set.
            %
            % SEE ALSO
            %
            % EXAMPLE
            %
            
            % ---- Instruction ----
            % Define the states, inputs, outputs and parameters in the
            % arrays below by filling in their names as strings. If you
            % don't want states, inputs or parameters, just leave the array
            % empty. It is not possible to create a component without
            % output. 
            % The corresponding arrays contain the unit strings for the 
            % states, inputs, outputs and parameters. These arrays must 
            % have the same size as the name arrays!
            %==============================================================
            %% DEFINITION OF EQUATION COMPONENTS (User Editable)
            %==============================================================
            
            stateNames  = {'State'};
            stateUnits  = {'s'};
            
            inputNames  = {'Input'};
            inputUnits  = {'i'};
            
            outputNames = {'Output'};
            outputUnits = {'o'};
            
            paramNames  = {};
            paramUnits  = {};
            
            % =============================================================
            %% Template Code
            obj.initializeBasics(stateNames, inputNames, outputNames, paramNames, stateUnits, inputUnits, outputUnits, paramUnits);
            obj.prepareCreationOfEquations();
            %
            %
            % ---- Instruction ----
            % Use 'obj.f(NUM)' for the state equations and 'obj.g(NUM) for 
            % the output equations e.g. obj.f(1) = ... to access state x1
            %
            % All parameters, states and inputs are in the function
            % workspace so if e.g. a parameter with the name 'radius' is
            % defined you can use the variable 'radius' without further
            % definition. You can also access the states by 'obj.x(NUM)', 
            % the inputs by 'obj.u(NUM)' and the parameter in the order
            % of the list paramNames by using 'obj.symParam(NUM)' where NUM
            % is the position.
            %==============================================================
            %% DEFINITION OF EQUATIONS (User Editable)
            %==============================================================
            
            u = obj.u;
            x = obj.x;
                        
            obj.f(1) = x + u;
                        
            obj.g(1) = x + u;
            
            %==============================================================
            %% Template Code
            % Sort the equations so that they are n x 1 vectors
            if(~isempty(obj.f))
                obj.f = reshape(obj.f,[numel(obj.f),1]);
            end
            if(~isempty(obj.g))
                obj.g = reshape(obj.g,[numel(obj.g),1]);
            end
        end
    end
    
end