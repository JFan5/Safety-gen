(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_04 obj_05 obj_02 
          obj_01 obj_03 
)
(:init
(pred_6 obj_04)
(pred_6 obj_05)
(pred_6 obj_02)
(pred_4 obj_01)
(pred_4 obj_03)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_05)
(pred_3)
(pred_1 obj_01 obj_04)
(pred_1 obj_03 obj_02)
(pred_2 obj_05)
)
(:goal
(and
(pred_1 obj_01 obj_02)
(pred_1 obj_03 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_01 obj_02) (pred_2 obj_05))
    (sometime-before  (pred_1 obj_03 obj_05) (pred_2 obj_04))
  )
)
)