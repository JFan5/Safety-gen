(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_02 obj_03 obj_01 
          obj_04 obj_05 
)
(:init
(pred_5 obj_02)
(pred_5 obj_03)
(pred_5 obj_01)
(pred_1 obj_04)
(pred_1 obj_05)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(pred_6)
(pred_3 obj_04 obj_01)
(pred_3 obj_05 obj_03)
(pred_2 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_01)
(pred_3 obj_05 obj_02)
)
)

(:constraints
  (sometime-before  (pred_3 obj_05 obj_02) (pred_2 obj_01))
)
)