(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_05 obj_06 obj_03 
          obj_01 obj_02 obj_04 
)
(:init
(pred_4 obj_05)
(pred_4 obj_06)
(pred_4 obj_03)
(pred_5 obj_01)
(pred_5 obj_02)
(pred_5 obj_04)
(not-eq obj_05 obj_06)
(not-eq obj_06 obj_05)
(not-eq obj_05 obj_03)
(not-eq obj_03 obj_05)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_06)
(pred_2)
(pred_1 obj_01 obj_06)
(pred_1 obj_02 obj_06)
(pred_1 obj_04 obj_06)
(pred_3 obj_05)
)
(:goal
(and
(pred_1 obj_01 obj_05)
(pred_1 obj_02 obj_03)
(pred_1 obj_04 obj_05)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_01 obj_05) (pred_3 obj_03))
    (sometime-before  (pred_1 obj_02 obj_03) (pred_3 obj_05))
    (sometime-before  (pred_1 obj_04 obj_05) (pred_3 obj_03))
  )
)
)