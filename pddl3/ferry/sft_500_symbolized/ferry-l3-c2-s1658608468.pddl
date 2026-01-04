(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_02 obj_01 obj_03 
          obj_04 obj_05 
)
(:init
(pred_6 obj_02)
(pred_6 obj_01)
(pred_6 obj_03)
(pred_2 obj_04)
(pred_2 obj_05)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(pred_3)
(pred_5 obj_04 obj_03)
(pred_5 obj_05 obj_01)
(pred_1 obj_01)
)
(:goal
(and
(pred_5 obj_04 obj_03)
(pred_5 obj_05 obj_03)
)
)

(:constraints
  (sometime-before  (pred_5 obj_05 obj_03) (pred_1 obj_02))
)
)