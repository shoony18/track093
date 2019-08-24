window.draw_graph_training_time = -> 
    ctx = document.getElementById("myChart_training_time").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
             labels: gon.recent_trainings_time_date,
             datasets: [{
                label: '練習日数',
                data: gon.recent_trainings_time,
                backgroundColor:"rgba(219,39,91,0.5)",
                borderColor:"rgba(219,39,91,1.0)",
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 30,
                        suggestedMin: 0,
                        stepSize: 5
                    }
                }]
            }
        }
    })

window.draw_graph_genre = -> 
    ctx = document.getElementById("myChart_genre").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["基礎","追込","実戦","調整","アクティブレスト","レスト","その他"],
            datasets: [{
                data: gon.recent_trainings_genre_per,
                backgroundColor: [
                    "rgba(219,39,91,0.5)",
                    "rgba(130,201,169,0.5)",
                    "rgba(255,183,76,0.5)",
                    'rgba(99, 205, 231, 0.2)',
                    'rgba(255, 153, 102, 0.2)',
                    'rgba(112, 231, 99, 0.2)',
                    'rgba(245, 243, 142, 0.2)',
                ],
                borderColor: [
                    "rgba(219,39,91,1.0)",
                    "rgba(130,201,169,1.0)",
                    "rgba(255,183,76,1.0)",
                    'rgba(99, 205, 231, 1.0)',
                    'rgba(255, 153, 102, 1.0)',
                    'rgba(112, 231, 99, 1.0)',
                    'rgba(245, 243, 142, 1.0)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
            }
        }
    })
window.draw_graph_stress = -> 
    ctx = document.getElementById("myChart_stress").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: gon.recent_trainings_stress_date,
            datasets: [{
                label: '5:強い,4:やや強い,3:普通,2:やや弱い,1:弱い',
                data: gon.recent_trainings_stress,
                backgroundColor:'rgba(255, 153, 102, 0.2)',
                borderColor:'rgba(255, 153, 102, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 5,
                        suggestedMin: 0,
                        stepSize: 1
                    }
                }]
            }
        }
    })
window.draw_graph_training_evaluation = -> 
    ctx = document.getElementById("myChart_training_evaluation").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["満足","やや満足","普通","やや不満","不満","その他"],
            datasets: [{
                data: gon.recent_trainings_evaluation_per,
                backgroundColor: [
                    "rgba(219,39,91,0.5)",
                    "rgba(130,201,169,0.5)",
                    "rgba(255,183,76,0.5)",
                    'rgba(99, 205, 231, 0.2)',
                    'rgba(255, 153, 102, 0.2)',
                    'rgba(112, 231, 99, 0.2)',
                ],
                borderColor: [
                    "rgba(219,39,91,1.0)",
                    "rgba(130,201,169,1.0)",
                    "rgba(255,183,76,1.0)",
                    'rgba(99, 205, 231, 1.0)',
                    'rgba(255, 153, 102, 1.0)',
                    'rgba(112, 231, 99, 1.0)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
            }
        }
    })

window.draw_graph_game_time = -> 
    ctx = document.getElementById("myChart_game_time").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
             labels: gon.recent_games_time_date,
             datasets: [{
                label: '試合日数',
                data: gon.recent_games_time,
                backgroundColor:"rgba(130,201,169,0.5)",
                borderColor:"rgba(130,201,169,1.0)",
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 10,
                        suggestedMin: 0,
                        stepSize: 5
                    }
                }]
            }
        }
    })

window.draw_graph_game_evaluation = -> 
    ctx = document.getElementById("myChart_game_evaluation").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["満足","やや満足","普通","やや不満","不満","その他"],
            datasets: [{
                data: gon.recent_games_evaluation_per,
                backgroundColor: [
                    "rgba(219,39,91,0.5)",
                    "rgba(130,201,169,0.5)",
                    "rgba(255,183,76,0.5)",
                    'rgba(99, 205, 231, 0.2)',
                    'rgba(255, 153, 102, 0.2)',
                    'rgba(112, 231, 99, 0.2)',
                ],
                borderColor: [
                    "rgba(219,39,91,1.0)",
                    "rgba(130,201,169,1.0)",
                    "rgba(255,183,76,1.0)",
                    'rgba(99, 205, 231, 1.0)',
                    'rgba(255, 153, 102, 1.0)',
                    'rgba(112, 231, 99, 1.0)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
            }
        }
    })
