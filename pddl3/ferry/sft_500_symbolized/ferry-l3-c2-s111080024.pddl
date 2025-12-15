(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_01 obj_05 obj_03 
          obj_04 obj_02 
)
(:init
(pred_4 obj_01)
(pred_4 obj_05)
(pred_4 obj_03)
(pred_3 obj_04)
(pred_3 obj_02)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(pred_5)
(pred_6 obj_04 obj_05)
(pred_6 obj_02 obj_01)
(pred_2 obj_03)
)
(:goal
(and
(pred_6 obj_04 obj_03)
(pred_6 obj_02 obj_01)
)
)

(:constraints
  (sometime-before  (pred_6 obj_04 obj_03) (pred_2 obj_01))
)
)