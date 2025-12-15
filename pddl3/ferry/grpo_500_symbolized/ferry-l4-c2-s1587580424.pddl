(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_02 obj_03 obj_06 obj_05 
          obj_04 obj_01 
)
(:init
(pred_3 obj_02)
(pred_3 obj_03)
(pred_3 obj_06)
(pred_3 obj_05)
(pred_1 obj_04)
(pred_1 obj_01)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_06)
(not-eq obj_06 obj_02)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_03 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_06 obj_05)
(not-eq obj_05 obj_06)
(pred_5)
(pred_6 obj_04 obj_02)
(pred_6 obj_01 obj_03)
(pred_2 obj_03)
)
(:goal
(and
(pred_6 obj_04 obj_06)
(pred_6 obj_01 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_04 obj_06) (pred_2 obj_05))
    (sometime-before  (pred_6 obj_01 obj_05) (pred_2 obj_02))
  )
)
)