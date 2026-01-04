(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_04 obj_05 obj_02 
          obj_01 obj_03 
)
(:init
(pred_5 obj_04)
(pred_5 obj_05)
(pred_5 obj_02)
(pred_3 obj_01)
(pred_3 obj_03)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_05)
(pred_1)
(pred_2 obj_01 obj_05)
(pred_2 obj_03 obj_04)
(pred_4 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_03 obj_04)
)
)

(:constraints
  (sometime-before  (pred_2 obj_01 obj_02) (pred_4 obj_04))
)
)