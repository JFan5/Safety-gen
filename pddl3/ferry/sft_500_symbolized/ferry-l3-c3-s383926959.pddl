(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_06 obj_04 obj_02 
          obj_03 obj_01 obj_05 
)
(:init
(pred_1 obj_06)
(pred_1 obj_04)
(pred_1 obj_02)
(pred_4 obj_03)
(pred_4 obj_01)
(pred_4 obj_05)
(not-eq obj_06 obj_04)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_02)
(not-eq obj_02 obj_06)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(pred_2)
(pred_6 obj_03 obj_02)
(pred_6 obj_01 obj_06)
(pred_6 obj_05 obj_06)
(pred_5 obj_06)
)
(:goal
(and
(pred_6 obj_03 obj_04)
(pred_6 obj_01 obj_04)
(pred_6 obj_05 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_03 obj_04) (pred_5 obj_06))
    (sometime-before  (pred_6 obj_01 obj_04) (pred_5 obj_02))
    (sometime-before  (pred_6 obj_05 obj_04) (pred_5 obj_02))
  )
)
)