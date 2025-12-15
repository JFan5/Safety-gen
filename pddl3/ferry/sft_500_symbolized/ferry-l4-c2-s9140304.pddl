(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_02 obj_01 obj_03 obj_05 
          obj_04 obj_06 
)
(:init
(pred_6 obj_02)
(pred_6 obj_01)
(pred_6 obj_03)
(pred_6 obj_05)
(pred_4 obj_04)
(pred_4 obj_06)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(pred_1)
(pred_3 obj_04 obj_05)
(pred_3 obj_06 obj_05)
(pred_2 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_02)
(pred_3 obj_06 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_3 obj_04 obj_02) (pred_2 obj_01))
    (sometime-before  (pred_3 obj_06 obj_01) (pred_2 obj_02))
  )
)
)