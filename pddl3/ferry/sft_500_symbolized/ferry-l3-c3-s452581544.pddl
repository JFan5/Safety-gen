(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_01 obj_03 obj_04 
          obj_05 obj_06 obj_02 
)
(:init
(pred_3 obj_01)
(pred_3 obj_03)
(pred_3 obj_04)
(pred_4 obj_05)
(pred_4 obj_06)
(pred_4 obj_02)
(not-eq obj_01 obj_03)
(not-eq obj_03 obj_01)
(not-eq obj_01 obj_04)
(not-eq obj_04 obj_01)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(pred_2)
(pred_6 obj_05 obj_01)
(pred_6 obj_06 obj_04)
(pred_6 obj_02 obj_03)
(pred_1 obj_03)
)
(:goal
(and
(pred_6 obj_05 obj_01)
(pred_6 obj_06 obj_01)
(pred_6 obj_02 obj_01)
)
)

(:constraints
  (and
    (sometime-before  (pred_6 obj_06 obj_01) (pred_1 obj_03))
    (sometime-before  (pred_6 obj_02 obj_01) (pred_1 obj_04))
  )
)
)