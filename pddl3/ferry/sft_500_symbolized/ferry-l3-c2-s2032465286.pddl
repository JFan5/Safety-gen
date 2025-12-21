(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_05 obj_04 obj_03 
          obj_02 obj_01 
)
(:init
(pred_5 obj_05)
(pred_5 obj_04)
(pred_5 obj_03)
(pred_2 obj_02)
(pred_2 obj_01)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(pred_4)
(pred_6 obj_02 obj_04)
(pred_6 obj_01 obj_05)
(pred_3 obj_04)
)
(:goal
(and
(pred_6 obj_02 obj_05)
(pred_6 obj_01 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_02 obj_05) (pred_3 obj_03))
    (sometime-before  (pred_6 obj_01 obj_04) (pred_3 obj_03))
  )
)
)