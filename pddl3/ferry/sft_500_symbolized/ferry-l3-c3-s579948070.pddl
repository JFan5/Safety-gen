(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_03 obj_06 obj_01 
          obj_05 obj_04 obj_02 
)
(:init
(pred_6 obj_03)
(pred_6 obj_06)
(pred_6 obj_01)
(pred_4 obj_05)
(pred_4 obj_04)
(pred_4 obj_02)
(not-eq obj_03 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_06 obj_01)
(not-eq obj_01 obj_06)
(pred_5)
(pred_2 obj_05 obj_06)
(pred_2 obj_04 obj_01)
(pred_2 obj_02 obj_06)
(pred_1 obj_01)
)
(:goal
(and
(pred_2 obj_05 obj_01)
(pred_2 obj_04 obj_01)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (sometime-before  (pred_2 obj_05 obj_01) (pred_1 obj_03))
)
)