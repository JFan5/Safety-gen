(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_02 obj_03 obj_04 
          obj_06 obj_01 obj_05 
)
(:init
(pred_2 obj_02)
(pred_2 obj_03)
(pred_2 obj_04)
(pred_3 obj_06)
(pred_3 obj_01)
(pred_3 obj_05)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(pred_4)
(pred_1 obj_06 obj_04)
(pred_1 obj_01 obj_03)
(pred_1 obj_05 obj_02)
(pred_5 obj_04)
)
(:goal
(and
(pred_1 obj_06 obj_02)
(pred_1 obj_01 obj_04)
(pred_1 obj_05 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_06 obj_02) (pred_5 obj_03))
    (sometime-before  (pred_1 obj_01 obj_04) (pred_5 obj_02))
    (sometime-before  (pred_1 obj_05 obj_04) (pred_5 obj_03))
  )
)
)