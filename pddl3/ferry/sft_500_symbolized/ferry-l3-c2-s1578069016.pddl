(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_02 obj_05 obj_03 
          obj_04 obj_01 
)
(:init
(pred_2 obj_02)
(pred_2 obj_05)
(pred_2 obj_03)
(pred_4 obj_04)
(pred_4 obj_01)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(pred_5)
(pred_6 obj_04 obj_05)
(pred_6 obj_01 obj_03)
(pred_1 obj_02)
)
(:goal
(and
(pred_6 obj_04 obj_02)
(pred_6 obj_01 obj_03)
)
)

(:constraints
  (sometime-before  (pred_6 obj_04 obj_02) (pred_1 obj_03))
)
)