(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_01 obj_02 obj_03 obj_05 
          obj_04 obj_06 
)
(:init
(pred_2 obj_01)
(pred_2 obj_02)
(pred_2 obj_03)
(pred_2 obj_05)
(pred_4 obj_04)
(pred_4 obj_06)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(pred_6)
(pred_5 obj_04 obj_01)
(pred_5 obj_06 obj_02)
(pred_3 obj_02)
)
(:goal
(and
(pred_5 obj_04 obj_03)
(pred_5 obj_06 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_04 obj_03) (pred_3 obj_05))
    (sometime-before  (pred_5 obj_06 obj_05) (pred_3 obj_01))
  )
)
)