(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_06 obj_05 obj_03 
          obj_04 obj_01 obj_02 
)
(:init
(pred_5 obj_06)
(pred_5 obj_05)
(pred_5 obj_03)
(pred_4 obj_04)
(pred_4 obj_01)
(pred_4 obj_02)
(not-eq obj_06 obj_05)
(not-eq obj_05 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_06)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(pred_1)
(pred_3 obj_04 obj_03)
(pred_3 obj_01 obj_06)
(pred_3 obj_02 obj_05)
(pred_2 obj_03)
)
(:goal
(and
(pred_3 obj_04 obj_03)
(pred_3 obj_01 obj_03)
(pred_3 obj_02 obj_05)
)
)

(:constraints
  (sometime-before  (pred_3 obj_01 obj_03) (pred_2 obj_05))
)
)