(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_05 obj_04 obj_03 
          obj_01 obj_02 
)
(:init
(pred_4 obj_05)
(pred_4 obj_04)
(pred_4 obj_03)
(pred_5 obj_01)
(pred_5 obj_02)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(pred_2)
(pred_3 obj_01 obj_04)
(pred_3 obj_02 obj_03)
(pred_6 obj_03)
)
(:goal
(and
(pred_3 obj_01 obj_03)
(pred_3 obj_02 obj_03)
)
)

(:constraints
  (sometime-before  (pred_3 obj_01 obj_03) (pred_6 obj_05))
)
)