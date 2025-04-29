Search Tree for the BMI Health Evaluation Prolog Program:

The program uses a sequence of predicates to interact with the user and evaluate health based on BMI, calorie intake, and workout frequency.

1. start/0
   - Entry point of the program.
   - Asks for weight and height.
   - Calculates BMI and categorizes it.
   - Asks for calorie intake and workout frequency.
   - Evaluates health.
   - If overweight or obese, asks for weight loss goal and adjusts calorie intake.

2. calculate_bmi/3
   - Calculates BMI from weight and height.

3. categorize_bmi/2
   - Categorizes BMI into underweight, normal, overweight, or obese.

4. ask_calorie_intake/2
   - Prompts user for daily calorie intake.

5. ask_workout_frequency/2
   - Prompts user for workout frequency.

6. calorie_range/3
   - Defines healthy calorie intake ranges per BMI category.

7. workout_range/3
   - Defines healthy workout frequency ranges per BMI category.

8. evaluate_health/3
   - Checks if calorie intake and workout frequency are within healthy ranges.
   - Displays appropriate message.

9. ask_weight_loss_goal/2
   - If overweight or obese, asks user for weight loss goal.
   - Adjusts calorie intake accordingly.

10. adjust_calorie_intake/3
    - Calculates adjusted calorie intake based on weight loss goal.

This search tree represents the flow of predicates and their roles in the program.
