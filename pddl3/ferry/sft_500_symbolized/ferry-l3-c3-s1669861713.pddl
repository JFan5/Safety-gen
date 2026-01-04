(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_02 obj_01 obj_03 
          obj_05 obj_04 obj_06 
)
(:init
(pred_4 obj_02)
(pred_4 obj_01)
(pred_4 obj_03)
(pred_1 obj_05)
(pred_1 obj_04)
(pred_1 obj_06)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(pred_6)
(pred_5 obj_05 obj_03)
(pred_5 obj_04 obj_02)
(pred_5 obj_06 obj_03)
(pred_2 obj_03)
)
(:goal
(and
(pred_5 obj_05 obj_02)
(pred_5 obj_04 obj_02)
(pred_5 obj_06 obj_03)
)
)

(:constraints
  (sometime-before  (pred_5 obj_05 obj_02) (pred_2 obj_01))
)
)