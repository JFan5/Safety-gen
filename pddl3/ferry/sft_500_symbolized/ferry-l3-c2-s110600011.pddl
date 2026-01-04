(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_03 obj_01 obj_04 
          obj_05 obj_02 
)
(:init
(pred_3 obj_03)
(pred_3 obj_01)
(pred_3 obj_04)
(pred_2 obj_05)
(pred_2 obj_02)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_01 obj_04)
(not-eq obj_04 obj_01)
(pred_6)
(pred_5 obj_05 obj_01)
(pred_5 obj_02 obj_03)
(pred_4 obj_01)
)
(:goal
(and
(pred_5 obj_05 obj_04)
(pred_5 obj_02 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_05 obj_04) (pred_4 obj_03))
    (sometime-before  (pred_5 obj_02 obj_04) (pred_4 obj_01))
  )
)
)