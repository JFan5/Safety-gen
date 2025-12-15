(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_05 obj_01 obj_06 
          obj_03 obj_04 obj_02 
)
(:init
(pred_3 obj_05)
(pred_3 obj_01)
(pred_3 obj_06)
(pred_5 obj_03)
(pred_5 obj_04)
(pred_5 obj_02)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_05)
(not-eq obj_05 obj_06)
(not-eq obj_06 obj_05)
(not-eq obj_01 obj_06)
(not-eq obj_06 obj_01)
(pred_6)
(pred_1 obj_03 obj_05)
(pred_1 obj_04 obj_06)
(pred_1 obj_02 obj_01)
(pred_4 obj_06)
)
(:goal
(and
(pred_1 obj_03 obj_06)
(pred_1 obj_04 obj_05)
(pred_1 obj_02 obj_06)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_03 obj_06) (pred_4 obj_01))
    (sometime-before  (pred_1 obj_04 obj_05) (pred_4 obj_01))
    (sometime-before  (pred_1 obj_02 obj_06) (pred_4 obj_05))
  )
)
)