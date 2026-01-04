(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_02 obj_05 obj_01 
          obj_03 obj_06 obj_04 
)
(:init
(pred_5 obj_02)
(pred_5 obj_05)
(pred_5 obj_01)
(pred_6 obj_03)
(pred_6 obj_06)
(pred_6 obj_04)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_05)
(pred_3)
(pred_1 obj_03 obj_02)
(pred_1 obj_06 obj_05)
(pred_1 obj_04 obj_05)
(pred_2 obj_01)
)
(:goal
(and
(pred_1 obj_03 obj_02)
(pred_1 obj_06 obj_05)
(pred_1 obj_04 obj_01)
)
)

(:constraints
  (sometime-before  (pred_1 obj_04 obj_01) (pred_2 obj_02))
)
)