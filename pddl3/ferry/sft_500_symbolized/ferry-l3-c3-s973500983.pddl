(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_03 obj_02 obj_05 
          obj_01 obj_04 obj_06 
)
(:init
(pred_1 obj_03)
(pred_1 obj_02)
(pred_1 obj_05)
(pred_2 obj_01)
(pred_2 obj_04)
(pred_2 obj_06)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(pred_4)
(pred_3 obj_01 obj_02)
(pred_3 obj_04 obj_05)
(pred_3 obj_06 obj_05)
(pred_5 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_05)
(pred_3 obj_04 obj_03)
(pred_3 obj_06 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_3 obj_01 obj_05) (pred_5 obj_03))
    (sometime-before  (pred_3 obj_04 obj_03) (pred_5 obj_02))
  )
)
)