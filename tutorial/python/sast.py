from runpy import run_module
import actr
from statistics import mean

actr.load_act_r_model("ACT-R:final-project;sast-alt.lisp")

# These global variables are used to transfer the trial data between functions
# without having to pass vartiables.
trial_problems = []
trial_responses = []
trial_correct = []
trial_times = []
start_time = 0
trial_accuracy = 0

# These global variables are my best attempt at getting the data from the paper.
# The data did not actually exist from my findings, so I had to read the small
# graphs. 
hours = [0, 2, 4, 6, 8, 10, 12, 14, 
        16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 
        40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 
        64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86]

human_responses = [0.89, 0.9, 0.9, 0.91, 0.92, 0.86, 0.9, 0.88,
                 0.9, 0.87, 0.85, 0.86, 0.85, 0.89, 0.9, 0.89, 0.9, 0.91, 0.87, 0.89, 
                 0.93, 0.84, 0.67, 0.72, 0.82, 0.82, 0.85, 0.87, 0.86, 0.86, 0.85, 0.87, 
                0.88, 0.83, 0.74, 0.62, 0.77, 0.85, 0.9, 0.85, 0.86, 0.84, 0.89, 0.84]

human_times = [1250, 1100, 1050, 1000, 1200, 1100, 1050, 1300, 
            1050, 1250, 1350, 1500, 1600, 1300, 1250, 1250, 1400, 1200, 1400, 1350, 
            1400, 1700, 2750, 2300, 1650, 1600, 1400, 1600, 1600, 1350, 1350, 1250, 
            1750, 1900, 2300, 2000, 1950, 1700, 1300, 1700, 1600, 1800, 1750, 1600]

paper_responses = [0.9, 0.9, 0.9, 0.9, 0.9, 0.91, 0.9, 0.89,
                    0.9, 0.9, 0.89, 0.89, 0.9, 0.89, 0.9, 0.89, 0.91, 0.91, 0.89, 0.9,
                    0.89, 0.87, 0.85, 0.83, 0.82, 0.82, 0.85, 0.87, 0.87, 0.87, 0.87, 0.86,
                    0.84, 0.8, 0.65, 0.5, 0.5, 0.63, 0.75, 0.82, 0.85, 0.88, 0.89, 0.89]

paper_times = [1100, 1100, 1100, 1100, 1100, 1100, 1150, 1150,
            1150, 1200, 1250, 1300, 1350, 1350, 1300, 1300, 1250, 1250, 1250, 1350,
            1400, 1500, 1600, 1700, 1750, 1700, 1600, 1500, 1450, 1450, 1450, 1350,
            1600, 1750, 2000, 2100, 2300, 2500, 2500, 2200, 1800, 1450, 1450, 1500]

retrieval_thresholds = [-80, -79, -78, -77, -76, -75, -74, -73, 
                -72, -71, -70, -69, -68, -67, -66, -65, -64, -63, -62, -61, 
                -60, -59, -58, -57, -56, -55, -54, -53, -52, -51, -50, -49, 
                -48, -47, -46, -45, -44, -43, -42, -41, -40, -39, -38, -37]

activations = [10000, 9900, 9800, 9700, 9600, 9500, 9400, 9300, 
        9200, 9100, 9000, 8900, 8800, 8700, 8600, 8500, 8400, 8300, 8200, 8100, 
        8000, 7900, 7800, 7700, 7600, 7500, 7400, 7300, 7200, 7100, 7000, 6900, 
        6800, 6700, 6600, 6500, 6400, 6300, 6200, 6100, 6000, 5900, 5800, 5700]

# This class will be used to store the different problems that could be presented
# to the model. 
class problem():
    def __init__(self,num1,num2,operator,correct_answer):
        self.num1 = num1
        self.num2 = num2
        self.operator = operator
        self.correct_answer = correct_answer

# This function is used to report the accuracy of the trial
def accuracy(verbose=False):
    global trial_correct
    global trial_responses
    global trial_accuracy
    correct = 0
    for x,y in zip(trial_correct, trial_responses):
        if x == y:
            correct += 1
    trial_accuracy = (correct/len(trial_responses))
    if verbose:
        print("ACCURACY:\t{}%".format(trial_accuracy*100))


# The present_problem function will be provided a problem to present as well as
# an optional parameter to restart the window between problems. 
def present_problem(prob, vis=True):
    # if the model is performing the task it installs that window device for the model.
    w = actr.open_exp_window("Serial Addition/Subtraction Experiment", visible=vis)
    actr.install_device(w)

    if(vis==False):
        actr.set_parameter_value(":v","nil")
    else:
        actr.set_parameter_value(":v","t")

    # add the text from the trial to the window and set the start time in the trial structure.
    actr.add_text_to_exp_window(None, prob.num1, x=100, y=150)
    actr.schedule_event_relative(0.2,"clear-exp-window",params=[w])
    actr.schedule_event_relative(0.4,"add-text-to-exp-window",params=[w,prob.num2,{"x":100, "y":150}]) 
    actr.schedule_event_relative(0.6,"clear-exp-window",params=[w])
    actr.schedule_event_relative(0.8,"add-text-to-exp-window",params=[w, prob.operator,{"x":100, "y":150}])

    # Add a command for our respond_to_key_press function so that
    # ACT-R can call it.
    actr.add_command("sast-response",respond_to_key_press,
                     "SAST task key press response monitor")
    
    actr.monitor_command("output-key","sast-response")

    global start_time
    start_time = actr.get_time(True)
    # Run the model for up to 2 seconds in real time mode.
    actr.run_full_time(2) 
      
    # Stop monitoring the output-key action and remove our command.
    actr.remove_command_monitor("output-key","sast-response")
    actr.remove_command("sast-response")

# This function creates 50 problems for the trial
def create_trial(problems=50):
    global trial_problems
    global trial_correct
    global trial_times
    global trial_responses
    trial_times = []
    trial_problems = []
    trial_correct = []
    trial_responses = []
    for i in range(problems):
        num1 = str(actr.random(10))
        num2 = str(actr.random(10))
        if(actr.random(2) == 0):
            op = "+"
        else:
            op = "-"
        correct = eval("("+num1+op+num2+")%10")
        prob = problem(num1, num2, op, correct)
        trial_problems.append(prob)
        trial_correct.append(correct)
    

# Print the problems
def print_trial():
    global trial_problems
    for each in trial_problems:
        print("{}{}{}={}".format(each.num1, each.operator, each.num2, each.correct_answer))


# This function will handle for running a trial which consists of 50 instances of 
# the SAST problems.
def run_trial(num=50,vis=True, verbose=False):
    create_trial(num)
    global trial_problems
    global trial_correct
    global trial_responses
    for each in trial_problems:
        present_problem(each,vis)
    for each in range(len(trial_responses)):
        trial_responses[each] = int(trial_responses[each])
    accuracy(verbose)

# This function will handle running the experiment based on time awake.
# It will run 10 trials (simulating 30 minutes of task) 8 times (simulating 8 
# participants). It will then all be averaged across the participants to get 
# the average response times (ms) and average accuracy (correct/total * 100). 
def time_awake_experiment(hour, verbose=False):
    accuracies = []
    run_times = []
    for participants in range(8):
        if verbose:
            print("======Participant {}========".format(participants+1))
        for trials in range(10):
            run_trial(50, False, verbose)
            global trial_accuracy
            global trial_times
            accuracies.append(trial_accuracy)
            run_times.append(mean(trial_times))
    avg_accuracy = mean(accuracies)
    avg_time = mean(run_times)
    if verbose:
        print("Average Accuracy at hour {}: {}".format(hour, avg_accuracy))
        print("Average Runtime in ms at hour {}: {}".format(hour, avg_time))
    return avg_accuracy, avg_time

# This function will handle running the experiment for the whole 88 hours. 
# It will handle updating the utility threshold, base-level activation, and 
# retrieval thresholds as time goes by. It will print out a correlation and 
# deviation with the human data and the paper data. 
def run_experiment(verbose=False):
    global hours, human_responses, human_times, paper_responses, paper_times
    global retrieval_thresholds, utility_thresholds, activations
    model_responses = []
    model_times = []
    for time, rt, act in zip(hours, retrieval_thresholds, activations):
        actr.set_parameter_value(":rt", rt)
        actr.current_connection.evaluate_single("set-all-base-levels", act)
        acc, time = time_awake_experiment(time, verbose)
        model_responses.append(acc)
        model_times.append(time)
    print("=====Model data and Human data========")
    print("==============Accuracy================")
    actr.correlation(human_responses, model_responses)
    actr.mean_deviation(human_responses, model_responses)
    print("================Times=================")
    actr.correlation(human_times, model_times)
    actr.mean_deviation(human_times, model_times)
    print()
    print("=====Model data and Paper data========")
    print("==============Accuracy================")
    actr.correlation(paper_responses, model_responses)
    actr.mean_deviation(paper_responses, model_responses)
    print("================Times=================")
    actr.correlation(paper_times, model_times)
    actr.mean_deviation(paper_times, model_times)

# This function is the one that will be called when the participant
# presses a key, and it just records the result in the responses
def respond_to_key_press (model,key):
    global trial_times
    global start_time
    global trial_responses
    trial_responses.append(key)
    trial_times.append(actr.get_time(True)-start_time)
    # This could actually be used to fire the next problem in the trial
    # using schedule event relative

# This is a mini version of the experiment that uses every 4 data points
def run_mini_experiment(verbose=False):
    global hours, human_responses, human_times, paper_responses, paper_times
    global retrieval_thresholds, utility_thresholds, activations
    model_responses = []
    model_times = []
    mini_human_responses = []
    mini_human_times = []
    mini_paper_responses = []
    mini_paper_times = []
    mini_hours = []
    mini_retrieval_thresholds = []
    mini_activations = []
    count = 0
    for i in range(0,44):
        if count == 0:
            mini_human_responses.append(human_responses[i])
            mini_human_times.append(human_times[i])
            mini_paper_responses.append(paper_responses[i])
            mini_paper_times.append(paper_times[i])
            mini_hours.append(hours[i])
            mini_retrieval_thresholds.append(retrieval_thresholds[i])
            mini_activations.append(activations[i])
        count = (count + 1) % 4
    
    for time, rt, act in zip(mini_hours, mini_retrieval_thresholds, mini_activations):
        actr.set_parameter_value(":rt", rt)
        actr.current_connection.evaluate_single("set-all-base-levels", act)
        acc, run_time = time_awake_experiment(time, verbose)
        model_responses.append(acc)
        model_times.append(run_time)
    print("=====Model data and Human data========")
    print("==============Accuracy================")
    actr.correlation(mini_human_responses, model_responses)
    actr.mean_deviation(mini_human_responses, model_responses)
    print("================Times=================")
    actr.correlation(mini_human_times, model_times)
    actr.mean_deviation(mini_human_times, model_times)
    print()
    print("=====Model data and Paper data========")
    print("==============Accuracy================")
    actr.correlation(mini_paper_responses, model_responses)
    actr.mean_deviation(mini_paper_responses, model_responses)
    print("================Times=================")
    actr.correlation(mini_paper_times, model_times)
    actr.mean_deviation(mini_paper_times, model_times)

# This is an even smaller version of the experiment that uses every 11 data points
def run_super_mini_experiment(verbose=False):
    global hours, human_responses, human_times, paper_responses, paper_times
    global retrieval_thresholds, utility_thresholds, activations
    model_responses = []
    model_times = []
    mini_human_responses = []
    mini_human_times = []
    mini_paper_responses = []
    mini_paper_times = []
    mini_hours = []
    mini_retrieval_thresholds = []
    mini_activations = []
    count = 0
    for i in range(0,44):
        if count == 0:
            mini_human_responses.append(human_responses[i])
            mini_human_times.append(human_times[i])
            mini_paper_responses.append(paper_responses[i])
            mini_paper_times.append(paper_times[i])
            mini_hours.append(hours[i])
            mini_retrieval_thresholds.append(retrieval_thresholds[i])
            mini_activations.append(activations[i])
        count = (count + 1) % 11
    
    for time, rt, act in zip(mini_hours, mini_retrieval_thresholds, mini_activations):
        actr.set_parameter_value(":rt", rt)
        actr.current_connection.evaluate_single("set-all-base-levels", act)
        acc, run_time = time_awake_experiment(time, verbose)
        model_responses.append(acc)
        model_times.append(run_time)
    print("=====Model data and Human data========")
    print("==============Accuracy================")
    actr.correlation(mini_human_responses, model_responses)
    actr.mean_deviation(mini_human_responses, model_responses)
    print("================Times=================")
    actr.correlation(mini_human_times, model_times)
    actr.mean_deviation(mini_human_times, model_times)
    print()
    print("=====Model data and Paper data========")
    print("==============Accuracy================")
    actr.correlation(mini_paper_responses, model_responses)
    actr.mean_deviation(mini_paper_responses, model_responses)
    print("================Times=================")
    actr.correlation(mini_paper_times, model_times)
    actr.mean_deviation(mini_paper_times, model_times)

# This function is used as a test
def test_example(vis=True):
    p = problem('5','5','+','0')
    present_problem(p,vis)
    return 0