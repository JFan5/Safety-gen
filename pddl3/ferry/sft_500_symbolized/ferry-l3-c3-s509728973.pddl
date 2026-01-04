(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_06 obj_02 obj_03 
          obj_01 obj_04 obj_05 
)
(:init
(pred_5 obj_06)
(pred_5 obj_02)
(pred_5 obj_03)
(pred_6 obj_01)
(pred_6 obj_04)
(pred_6 obj_05)
(not-eq obj_06 obj_02)
(not-eq obj_02 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_06)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(pred_3)
(pred_4 obj_01 obj_06)
(pred_4 obj_04 obj_02)
(pred_4 obj_05 obj_06)
(pred_1 obj_02)
)
(:goal
(and
(pred_4 obj_01 obj_03)
(pred_4 obj_04 obj_06)
(pred_4 obj_05 obj_03)
)
)

(:constraints
  (and
    (sometime-before  (pred_4 obj_01 obj_03) (pred_1 obj_02))
    (sometime-before  (pred_4 obj_04 obj_06) (pred_1 obj_03))
    (sometime-before  (pred_4 obj_05 obj_03) (pred_1 obj_02))
  )
)
)