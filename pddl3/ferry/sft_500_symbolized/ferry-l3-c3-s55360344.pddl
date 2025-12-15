(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_04 obj_06 obj_05 
          obj_02 obj_03 obj_01 
)
(:init
(pred_1 obj_04)
(pred_1 obj_06)
(pred_1 obj_05)
(pred_2 obj_02)
(pred_2 obj_03)
(pred_2 obj_01)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_04)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_04)
(not-eq obj_06 obj_05)
(not-eq obj_05 obj_06)
(pred_6)
(pred_4 obj_02 obj_04)
(pred_4 obj_03 obj_06)
(pred_4 obj_01 obj_05)
(pred_5 obj_06)
)
(:goal
(and
(pred_4 obj_02 obj_05)
(pred_4 obj_03 obj_04)
(pred_4 obj_01 obj_06)
)
)

(:constraints
  (and
    (sometime-before  (pred_4 obj_02 obj_05) (pred_5 obj_06))
    (sometime-before  (pred_4 obj_03 obj_04) (pred_5 obj_05))
    (sometime-before  (pred_4 obj_01 obj_06) (pred_5 obj_04))
  )
)
)