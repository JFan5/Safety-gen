(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_06 obj_02 obj_01 
          obj_03 obj_05 obj_04 
)
(:init
(pred_6 obj_06)
(pred_6 obj_02)
(pred_6 obj_01)
(pred_4 obj_03)
(pred_4 obj_05)
(pred_4 obj_04)
(not-eq obj_06 obj_02)
(not-eq obj_02 obj_06)
(not-eq obj_06 obj_01)
(not-eq obj_01 obj_06)
(not-eq obj_02 obj_01)
(not-eq obj_01 obj_02)
(pred_3)
(pred_2 obj_03 obj_02)
(pred_2 obj_05 obj_02)
(pred_2 obj_04 obj_01)
(pred_5 obj_06)
)
(:goal
(and
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_06)
(pred_2 obj_04 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_2 obj_03 obj_06) (pred_5 obj_01))
    (sometime-before  (pred_2 obj_05 obj_06) (pred_5 obj_01))
  )
)
)