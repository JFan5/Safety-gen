(define (problem ferry-l3-c2)
(:domain ferry)
(:objects obj_01 obj_05 obj_02 
          obj_04 obj_03 
)
(:init
(pred_1 obj_01)
(pred_1 obj_05)
(pred_1 obj_02)
(pred_2 obj_04)
(pred_2 obj_03)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_05)
(pred_3)
(pred_4 obj_04 obj_01)
(pred_4 obj_03 obj_01)
(pred_6 obj_01)
)
(:goal
(and
(pred_4 obj_04 obj_05)
(pred_4 obj_03 obj_02)
)
)

(:constraints
  (and
    (sometime-before  (pred_4 obj_04 obj_05) (pred_6 obj_02))
    (sometime-before  (pred_4 obj_03 obj_02) (pred_6 obj_05))
  )
)
)