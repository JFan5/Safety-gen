(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_03 obj_01 obj_05 
          obj_06 obj_02 obj_04 
)
(:init
(pred_6 obj_03)
(pred_6 obj_01)
(pred_6 obj_05)
(pred_4 obj_06)
(pred_4 obj_02)
(pred_4 obj_04)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(pred_1)
(pred_3 obj_06 obj_03)
(pred_3 obj_02 obj_05)
(pred_3 obj_04 obj_01)
(pred_5 obj_05)
)
(:goal
(and
(pred_3 obj_06 obj_05)
(pred_3 obj_02 obj_03)
(pred_3 obj_04 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_3 obj_06 obj_05) (pred_5 obj_01))
    (sometime-before  (pred_3 obj_02 obj_03) (pred_5 obj_01))
    (sometime-before  (pred_3 obj_04 obj_05) (pred_5 obj_03))
  )
)
)