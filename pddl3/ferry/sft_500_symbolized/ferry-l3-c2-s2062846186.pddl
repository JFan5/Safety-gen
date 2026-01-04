(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_03 obj_05 obj_04 
          obj_01 obj_02 
)
(:init
(pred_4 obj_03)
(pred_4 obj_05)
(pred_4 obj_04)
(pred_1 obj_01)
(pred_1 obj_02)
(not-eq obj_03 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_05)
(pred_2)
(pred_6 obj_01 obj_03)
(pred_6 obj_02 obj_03)
(pred_5 obj_03)
)
(:goal
(and
(pred_6 obj_01 obj_05)
(pred_6 obj_02 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_01 obj_05) (pred_5 obj_04))
    (sometime-before  (pred_6 obj_02 obj_05) (pred_5 obj_04))
  )
)
)