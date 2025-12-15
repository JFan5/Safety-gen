(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_06 obj_05 obj_03 
          obj_02 obj_04 obj_01 
)
(:init
(pred_3 obj_06)
(pred_3 obj_05)
(pred_3 obj_03)
(pred_5 obj_02)
(pred_5 obj_04)
(pred_5 obj_01)
(not-eq obj_06 obj_05)
(not-eq obj_05 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_06)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(pred_2)
(pred_1 obj_02 obj_05)
(pred_1 obj_04 obj_05)
(pred_1 obj_01 obj_05)
(pred_6 obj_05)
)
(:goal
(and
(pred_1 obj_02 obj_03)
(pred_1 obj_04 obj_05)
(pred_1 obj_01 obj_03)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_02 obj_03) (pred_6 obj_06))
    (sometime-before  (pred_1 obj_01 obj_03) (pred_6 obj_06))
  )
)
)