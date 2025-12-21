(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_01 obj_05 obj_03 
          obj_06 obj_04 obj_02 
)
(:init
(pred_5 obj_01)
(pred_5 obj_05)
(pred_5 obj_03)
(pred_2 obj_06)
(pred_2 obj_04)
(pred_2 obj_02)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(pred_4)
(pred_6 obj_06 obj_03)
(pred_6 obj_04 obj_01)
(pred_6 obj_02 obj_05)
(pred_3 obj_05)
)
(:goal
(and
(pred_6 obj_06 obj_01)
(pred_6 obj_04 obj_01)
(pred_6 obj_02 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_06 obj_01) (pred_3 obj_05))
    (sometime-before  (pred_6 obj_02 obj_01) (pred_3 obj_03))
  )
)
)