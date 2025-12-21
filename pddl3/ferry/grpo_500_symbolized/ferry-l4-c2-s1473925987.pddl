(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_03 obj_04 obj_06 obj_01 
          obj_05 obj_02 
)
(:init
(pred_2 obj_03)
(pred_2 obj_04)
(pred_2 obj_06)
(pred_2 obj_01)
(pred_4 obj_05)
(pred_4 obj_02)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_06)
(not-eq obj_06 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_03)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_04)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_06 obj_01)
(not-eq obj_01 obj_06)
(pred_6)
(pred_5 obj_05 obj_01)
(pred_5 obj_02 obj_06)
(pred_3 obj_03)
)
(:goal
(and
(pred_5 obj_05 obj_06)
(pred_5 obj_02 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_5 obj_05 obj_06) (pred_3 obj_04))
    (sometime-before  (pred_5 obj_02 obj_04) (pred_3 obj_01))
  )
)
)