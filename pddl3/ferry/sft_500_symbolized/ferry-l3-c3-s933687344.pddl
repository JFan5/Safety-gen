(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_04 obj_03 obj_01 
          obj_02 obj_06 obj_05 
)
(:init
(pred_6 obj_04)
(pred_6 obj_03)
(pred_6 obj_01)
(pred_3 obj_02)
(pred_3 obj_06)
(pred_3 obj_05)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(pred_1)
(pred_5 obj_02 obj_03)
(pred_5 obj_06 obj_04)
(pred_5 obj_05 obj_04)
(pred_2 obj_04)
)
(:goal
(and
(pred_5 obj_02 obj_01)
(pred_5 obj_06 obj_01)
(pred_5 obj_05 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_02 obj_01) (pred_2 obj_04))
    (sometime-before  (pred_5 obj_06 obj_01) (pred_2 obj_03))
    (sometime-before  (pred_5 obj_05 obj_01) (pred_2 obj_03))
  )
)
)