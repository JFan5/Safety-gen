(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_01 obj_02 obj_03 
          obj_05 obj_04 
)
(:init
(pred_5 obj_01)
(pred_5 obj_02)
(pred_5 obj_03)
(pred_2 obj_05)
(pred_2 obj_04)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(pred_3)
(pred_4 obj_05 obj_01)
(pred_4 obj_04 obj_01)
(pred_1 obj_03)
)
(:goal
(and
(pred_4 obj_05 obj_03)
(pred_4 obj_04 obj_01)
)
)

(:constraints
  (sometime-before  (pred_4 obj_05 obj_03) (pred_1 obj_02))
)
)