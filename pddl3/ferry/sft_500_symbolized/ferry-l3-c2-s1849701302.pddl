(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_04 obj_03 obj_02 
          obj_01 obj_05 
)
(:init
(pred_3 obj_04)
(pred_3 obj_03)
(pred_3 obj_02)
(pred_2 obj_01)
(pred_2 obj_05)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(pred_6)
(pred_5 obj_01 obj_03)
(pred_5 obj_05 obj_04)
(pred_1 obj_03)
)
(:goal
(and
(pred_5 obj_01 obj_04)
(pred_5 obj_05 obj_04)
)
)

(:constraints
  (sometime-before  (pred_5 obj_01 obj_04) (pred_1 obj_02))
)
)