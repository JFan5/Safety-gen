(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_04 obj_06 obj_02 
          obj_01 obj_05 obj_03 
)
(:init
(pred_5 obj_04)
(pred_5 obj_06)
(pred_5 obj_02)
(pred_2 obj_01)
(pred_2 obj_05)
(pred_2 obj_03)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_06 obj_02)
(not-eq obj_02 obj_06)
(pred_4)
(pred_6 obj_01 obj_06)
(pred_6 obj_05 obj_06)
(pred_6 obj_03 obj_02)
(pred_3 obj_04)
)
(:goal
(and
(pred_6 obj_01 obj_02)
(pred_6 obj_05 obj_06)
(pred_6 obj_03 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_01 obj_02) (pred_3 obj_04))
    (sometime-before  (pred_6 obj_03 obj_04) (pred_3 obj_06))
  )
)
)