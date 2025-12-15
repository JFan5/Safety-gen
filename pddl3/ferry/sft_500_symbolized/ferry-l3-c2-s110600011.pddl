(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_05 obj_03 obj_01 
          obj_02 obj_04 
)
(:init
(pred_5 obj_05)
(pred_5 obj_03)
(pred_5 obj_01)
(pred_1 obj_02)
(pred_1 obj_04)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(pred_6)
(pred_4 obj_02 obj_03)
(pred_4 obj_04 obj_05)
(pred_3 obj_03)
)
(:goal
(and
(pred_4 obj_02 obj_01)
(pred_4 obj_04 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_4 obj_02 obj_01) (pred_3 obj_05))
    (sometime-before  (pred_4 obj_04 obj_01) (pred_3 obj_03))
  )
)
)