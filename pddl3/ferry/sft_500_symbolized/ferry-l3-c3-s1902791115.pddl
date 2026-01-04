(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_03 obj_06 obj_04 
          obj_02 obj_05 obj_01 
)
(:init
(pred_3 obj_03)
(pred_3 obj_06)
(pred_3 obj_04)
(pred_5 obj_02)
(pred_5 obj_05)
(pred_5 obj_01)
(not-eq obj_03 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_06 obj_04)
(not-eq obj_04 obj_06)
(pred_4)
(pred_6 obj_02 obj_06)
(pred_6 obj_05 obj_04)
(pred_6 obj_01 obj_06)
(pred_1 obj_06)
)
(:goal
(and
(pred_6 obj_02 obj_06)
(pred_6 obj_05 obj_03)
(pred_6 obj_01 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_05 obj_03) (pred_1 obj_06))
    (sometime-before  (pred_6 obj_01 obj_04) (pred_1 obj_03))
  )
)
)