(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_01 obj_03 obj_05 
          obj_04 obj_02 
)
(:init
(pred_5 obj_01)
(pred_5 obj_03)
(pred_5 obj_05)
(pred_1 obj_04)
(pred_1 obj_02)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(pred_3)
(pred_4 obj_04 obj_01)
(pred_4 obj_02 obj_01)
(pred_6 obj_03)
)
(:goal
(and
(pred_4 obj_04 obj_01)
(pred_4 obj_02 obj_03)
)
)

(:constraints
  (sometime-before  (pred_4 obj_02 obj_03) (pred_6 obj_05))
)
)