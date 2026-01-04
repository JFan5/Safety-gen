(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_04 obj_06 obj_05 obj_01 
          obj_03 obj_02 
)
(:init
(pred_6 obj_04)
(pred_6 obj_06)
(pred_6 obj_05)
(pred_6 obj_01)
(pred_4 obj_03)
(pred_4 obj_02)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_04)
(not-eq obj_04 obj_05)
(not-eq obj_05 obj_04)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_06 obj_05)
(not-eq obj_05 obj_06)
(not-eq obj_06 obj_01)
(not-eq obj_01 obj_06)
(not-eq obj_05 obj_01)
(not-eq obj_01 obj_05)
(pred_5)
(pred_1 obj_03 obj_04)
(pred_1 obj_02 obj_01)
(pred_2 obj_05)
)
(:goal
(and
(pred_1 obj_03 obj_05)
(pred_1 obj_02 obj_06)
)
)

(:constraints
  (and
    (sometime-before  (pred_1 obj_03 obj_05) (pred_2 obj_06))
    (sometime-before  (pred_1 obj_02 obj_06) (pred_2 obj_04))
  )
)
)