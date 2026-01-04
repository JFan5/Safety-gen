(define (problem ferry-l4-c2)
(:domain ferry)
(:objects obj_04 obj_01 obj_03 obj_02 
          obj_05 obj_06 
)
(:init
(pred_6 obj_04)
(pred_6 obj_01)
(pred_6 obj_03)
(pred_6 obj_02)
(pred_1 obj_05)
(pred_1 obj_06)
(not-eq obj_04 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_02)
(not-eq obj_02 obj_04)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_02)
(not-eq obj_02 obj_01)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(pred_5)
(pred_4 obj_05 obj_02)
(pred_4 obj_06 obj_01)
(pred_3 obj_01)
)
(:goal
(and
(pred_4 obj_05 obj_01)
(pred_4 obj_06 obj_04)
)
)

(:constraints
  (and
    (sometime-before  (pred_4 obj_05 obj_01) (pred_3 obj_04))
    (sometime-before  (pred_4 obj_06 obj_04) (pred_3 obj_03))
  )
)
)