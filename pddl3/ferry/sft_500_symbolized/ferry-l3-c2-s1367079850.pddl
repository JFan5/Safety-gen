(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_05 obj_03 obj_02 
          obj_01 obj_04 
)
(:init
(pred_1 obj_05)
(pred_1 obj_03)
(pred_1 obj_02)
(pred_3 obj_01)
(pred_3 obj_04)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_05)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(pred_5)
(pred_2 obj_01 obj_02)
(pred_2 obj_04 obj_03)
(pred_4 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_05)
(pred_2 obj_04 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_2 obj_01 obj_05) (pred_4 obj_03))
    (sometime-before  (pred_2 obj_04 obj_05) (pred_4 obj_02))
  )
)
)