(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_04 obj_02 obj_03 
          obj_06 obj_01 obj_05 
)
(:init
(pred_6 obj_04)
(pred_6 obj_02)
(pred_6 obj_03)
(pred_3 obj_06)
(pred_3 obj_01)
(pred_3 obj_05)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(pred_1)
(pred_2 obj_06 obj_02)
(pred_2 obj_01 obj_02)
(pred_2 obj_05 obj_02)
(pred_4 obj_02)
)
(:goal
(and
(pred_2 obj_06 obj_03)
(pred_2 obj_01 obj_02)
(pred_2 obj_05 obj_03)
)
)

(:constraints
  (and
    (sometime-before  (pred_2 obj_06 obj_03) (pred_4 obj_04))
    (sometime-before  (pred_2 obj_05 obj_03) (pred_4 obj_04))
  )
)
)