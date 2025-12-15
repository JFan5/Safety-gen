(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_04 obj_02 obj_01 obj_05 
          obj_03 obj_06 
)
(:init
(pred_3 obj_04)
(pred_3 obj_02)
(pred_3 obj_01)
(pred_3 obj_05)
(pred_1 obj_03)
(pred_1 obj_06)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_04)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_05)
(not-eq obj_05 obj_02)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(pred_5)
(pred_6 obj_03 obj_05)
(pred_6 obj_06 obj_01)
(pred_2 obj_01)
)
(:goal
(and
(pred_6 obj_03 obj_04)
(pred_6 obj_06 obj_02)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_03 obj_04) (pred_2 obj_02))
    (sometime-before  (pred_6 obj_06 obj_02) (pred_2 obj_04))
  )
)
)