(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_01 obj_04 obj_06 
          obj_05 obj_02 obj_03 
)
(:init
(pred_2 obj_01)
(pred_2 obj_04)
(pred_2 obj_06)
(pred_4 obj_05)
(pred_4 obj_02)
(pred_4 obj_03)
(not-eq obj_01 obj_04)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_06)
(not-eq obj_06 obj_01)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_04)
(pred_1)
(pred_3 obj_05 obj_01)
(pred_3 obj_02 obj_04)
(pred_3 obj_03 obj_01)
(pred_5 obj_04)
)
(:goal
(and
(pred_3 obj_05 obj_06)
(pred_3 obj_02 obj_06)
(pred_3 obj_03 obj_06)
)
)

(:constraints
  (and
    (sometime-before  (pred_3 obj_05 obj_06) (pred_5 obj_04))
    (sometime-before  (pred_3 obj_02 obj_06) (pred_5 obj_01))
    (sometime-before  (pred_3 obj_03 obj_06) (pred_5 obj_04))
  )
)
)