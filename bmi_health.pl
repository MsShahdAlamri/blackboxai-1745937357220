% BMI Health Evaluation Program in Prolog

% Start the program
start :-
    write('Enter your weight in kg: '), read(Weight),
    write('Enter your height in meters: '), read(Height),
    calculate_bmi(Weight, Height, BMI),
    categorize_bmi(BMI, Category),
    format('Your BMI is ~2f, which is categorized as ~w.~n', [BMI, Category]),
    ask_calorie_intake(Category, CalorieIntake),
    ask_workout_frequency(Category, WorkoutFreq),
    evaluate_health(Category, CalorieIntake, WorkoutFreq),
    ( (Category = overweight ; Category = obese) ->
        ask_weight_loss_goal(Weight, CalorieIntake)
    ; true).

% Calculate BMI
calculate_bmi(Weight, Height, BMI) :-
    BMI is Weight / (Height * Height).

% Categorize BMI
categorize_bmi(BMI, underweight) :- BMI < 18.5, !.
categorize_bmi(BMI, normal) :- BMI >= 18.5, BMI < 25, !.
categorize_bmi(BMI, overweight) :- BMI >= 25, BMI < 30, !.
categorize_bmi(BMI, obese) :- BMI >= 30, !.

% Ask for daily calorie intake
ask_calorie_intake(Category, CalorieIntake) :-
    format('Enter your daily calorie intake (in calories): ', []),
    read(CalorieIntake).

% Ask for workout frequency
ask_workout_frequency(Category, WorkoutFreq) :-
    format('Enter your workout frequency (days per week): ', []),
    read(WorkoutFreq).

% Define healthy calorie ranges
calorie_range(underweight, 2200, 2800).
calorie_range(normal, 1800, 2500).
calorie_range(overweight, 1500, 2000).
calorie_range(obese, 1200, 1800).

% Define healthy workout frequency ranges
workout_range(underweight, 3, 5).
workout_range(normal, 4, 6).
workout_range(overweight, 5, 6).
workout_range(obese, 5, 7).

% Evaluate health based on calorie intake and workout frequency
evaluate_health(Category, CalorieIntake, WorkoutFreq) :-
    calorie_range(Category, CalMin, CalMax),
    workout_range(Category, WorkMin, WorkMax),
    (CalorieIntake >= CalMin, CalorieIntake =< CalMax,
     WorkoutFreq >= WorkMin, WorkoutFreq =< WorkMax ->
        write('You are on the right track to achieving good health!'), nl
    ;
        write('You need to adjust your habits to match the recommended healthy range.'), nl).

% Ask weight loss goal if overweight or obese
ask_weight_loss_goal(Weight, CalorieIntake) :-
    write('How many kilos do you want to lose per week? (Enter 1, 0.75, or 0.5): '),
    read(Goal),
    adjust_calorie_intake(Goal, CalorieIntake, NewCalorieIntake),
    format('To lose ~w kg per week, your adjusted daily calorie intake should be ~w calories.~n', [Goal, NewCalorieIntake]).

% Adjust calorie intake based on weight loss goal
adjust_calorie_intake(1, CalorieIntake, NewCalorieIntake) :-
    NewCalorieIntake is CalorieIntake - 1000, !.
adjust_calorie_intake(0.75, CalorieIntake, NewCalorieIntake) :-
    NewCalorieIntake is CalorieIntake - 500, !.
adjust_calorie_intake(0.5, CalorieIntake, NewCalorieIntake) :-
    NewCalorieIntake is CalorieIntake - 300, !.
adjust_calorie_intake(_, CalorieIntake, CalorieIntake) :-
    write('Invalid goal entered. No adjustment made.'), nl.
