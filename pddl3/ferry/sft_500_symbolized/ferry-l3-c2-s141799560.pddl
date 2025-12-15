(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_03 obj_01 obj_05 
          obj_04 obj_02 
)
(:init
(pred_1 obj_03)
(pred_1 obj_01)
(pred_1 obj_05)
(pred_4 obj_04)
(pred_4 obj_02)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(pred_2)
(pred_5 obj_04 obj_03)
(pred_5 obj_02 obj_03)
(pred_6 obj_03)
)
(:goal
(and
(pred_5 obj_04 obj_05)
(pred_5 obj_02 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_04 obj_05) (pred_6 obj_01))
    (sometime-before  (pred_5 obj_02 obj_05) (pred_6 obj_01))
  )
)
)