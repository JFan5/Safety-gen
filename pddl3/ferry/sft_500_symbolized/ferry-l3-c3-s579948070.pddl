(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_03 obj_06 obj_02 
          obj_01 obj_05 obj_04 
)
(:init
(pred_4 obj_03)
(pred_4 obj_06)
(pred_4 obj_02)
(pred_6 obj_01)
(pred_6 obj_05)
(pred_6 obj_04)
(not-eq obj_03 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_06 obj_02)
(not-eq obj_02 obj_06)
(pred_5)
(pred_3 obj_01 obj_06)
(pred_3 obj_05 obj_02)
(pred_3 obj_04 obj_06)
(pred_1 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_05 obj_02)
(pred_3 obj_04 obj_06)
)
)

(:constraints
  (sometime-before  (pred_3 obj_01 obj_02) (pred_1 obj_03))
)
)