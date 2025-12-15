(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_04 obj_01 obj_03 obj_06 
          obj_02 obj_05 
)
(:init
(pred_4 obj_04)
(pred_4 obj_01)
(pred_4 obj_03)
(pred_4 obj_06)
(pred_2 obj_02)
(pred_2 obj_05)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_06)
(not-eq obj_06 obj_04)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_06)
(not-eq obj_06 obj_01)
(not-eq obj_03 obj_06)
(not-eq obj_06 obj_03)
(pred_1)
(pred_6 obj_02 obj_01)
(pred_6 obj_05 obj_06)
(pred_5 obj_06)
)
(:goal
(and
(pred_6 obj_02 obj_03)
(pred_6 obj_05 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_02 obj_03) (pred_5 obj_04))
    (sometime-before  (pred_6 obj_05 obj_04) (pred_5 obj_01))
  )
)
)