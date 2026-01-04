(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_05 obj_01 obj_03 
          obj_02 obj_04 obj_06 
)
(:init
(pred_1 obj_05)
(pred_1 obj_01)
(pred_1 obj_03)
(pred_3 obj_02)
(pred_3 obj_04)
(pred_3 obj_06)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(pred_6)
(pred_5 obj_02 obj_03)
(pred_5 obj_04 obj_01)
(pred_5 obj_06 obj_05)
(pred_2 obj_05)
)
(:goal
(and
(pred_5 obj_02 obj_03)
(pred_5 obj_04 obj_05)
(pred_5 obj_06 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_04 obj_05) (pred_2 obj_03))
    (sometime-before  (pred_5 obj_06 obj_01) (pred_2 obj_03))
  )
)
)