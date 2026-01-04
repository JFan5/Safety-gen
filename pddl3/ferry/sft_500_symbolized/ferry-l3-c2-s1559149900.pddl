(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_03 obj_04 obj_02 
          obj_01 obj_05 
)
(:init
(pred_5 obj_03)
(pred_5 obj_04)
(pred_5 obj_02)
(pred_2 obj_01)
(pred_2 obj_05)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(pred_1)
(pred_3 obj_01 obj_04)
(pred_3 obj_05 obj_02)
(pred_6 obj_03)
)
(:goal
(and
(pred_3 obj_01 obj_04)
(pred_3 obj_05 obj_03)
)
)

(:constraints
  (sometime-before  (pred_3 obj_05 obj_03) (pred_6 obj_04))
)
)