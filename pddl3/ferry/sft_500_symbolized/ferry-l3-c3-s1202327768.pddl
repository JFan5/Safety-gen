(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_05 obj_01 obj_03 
          obj_04 obj_02 obj_06 
)
(:init
(pred_6 obj_05)
(pred_6 obj_01)
(pred_6 obj_03)
(pred_1 obj_04)
(pred_1 obj_02)
(pred_1 obj_06)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(pred_4)
(pred_2 obj_04 obj_01)
(pred_2 obj_02 obj_05)
(pred_2 obj_06 obj_05)
(pred_3 obj_05)
)
(:goal
(and
(pred_2 obj_04 obj_03)
(pred_2 obj_02 obj_01)
(pred_2 obj_06 obj_03)
)
)

(:constraints
  (and
    (sometime-before  (pred_2 obj_04 obj_03) (pred_3 obj_05))
    (sometime-before  (pred_2 obj_02 obj_01) (pred_3 obj_03))
    (sometime-before  (pred_2 obj_06 obj_03) (pred_3 obj_01))
  )
)
)