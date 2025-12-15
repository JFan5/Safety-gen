(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_02 obj_03 obj_01 
          obj_05 obj_04 
)
(:init
(pred_3 obj_02)
(pred_3 obj_03)
(pred_3 obj_01)
(pred_6 obj_05)
(pred_6 obj_04)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(pred_1)
(pred_5 obj_05 obj_02)
(pred_5 obj_04 obj_03)
(pred_2 obj_02)
)
(:goal
(and
(pred_5 obj_05 obj_01)
(pred_5 obj_04 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_05 obj_01) (pred_2 obj_03))
    (sometime-before  (pred_5 obj_04 obj_01) (pred_2 obj_02))
  )
)
)