(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_02 obj_03 obj_04 
          obj_05 obj_01 
)
(:init
(pred_1 obj_02)
(pred_1 obj_03)
(pred_1 obj_04)
(pred_3 obj_05)
(pred_3 obj_01)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(pred_5)
(pred_6 obj_05 obj_03)
(pred_6 obj_01 obj_04)
(pred_4 obj_02)
)
(:goal
(and
(pred_6 obj_05 obj_03)
(pred_6 obj_01 obj_02)
)
)

(:constraints
  (sometime-before  (pred_6 obj_01 obj_02) (pred_4 obj_03))
)
)