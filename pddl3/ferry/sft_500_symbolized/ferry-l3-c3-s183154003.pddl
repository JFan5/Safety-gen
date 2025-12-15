(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_04 obj_05 obj_02 
          obj_03 obj_01 obj_06 
)
(:init
(pred_6 obj_04)
(pred_6 obj_05)
(pred_6 obj_02)
(pred_2 obj_03)
(pred_2 obj_01)
(pred_2 obj_06)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_05 obj_02)
(not-eq obj_02 obj_05)
(pred_5)
(pred_1 obj_03 obj_02)
(pred_1 obj_01 obj_05)
(pred_1 obj_06 obj_04)
(pred_4 obj_02)
)
(:goal
(and
(pred_1 obj_03 obj_04)
(pred_1 obj_01 obj_05)
(pred_1 obj_06 obj_02)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_03 obj_04) (pred_4 obj_05))
    (sometime-before  (pred_1 obj_06 obj_02) (pred_4 obj_05))
  )
)
)