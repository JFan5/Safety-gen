(define (problem ferry-l3-c3)
(:domain ferry)
(:objects obj_03 obj_02 obj_04 
          obj_01 obj_06 obj_05 
)
(:init
(pred_4 obj_03)
(pred_4 obj_02)
(pred_4 obj_04)
(pred_1 obj_01)
(pred_1 obj_06)
(pred_1 obj_05)
(not-eq obj_03 obj_02)
(not-eq obj_02 obj_03)
(not-eq obj_03 obj_04)
(not-eq obj_04 obj_03)
(not-eq obj_02 obj_04)
(not-eq obj_04 obj_02)
(pred_6)
(pred_3 obj_01 obj_04)
(pred_3 obj_06 obj_02)
(pred_3 obj_05 obj_02)
(pred_5 obj_03)
)
(:goal
(and
(pred_3 obj_01 obj_04)
(pred_3 obj_06 obj_03)
(pred_3 obj_05 obj_03)
)
)

(:constraints
  (and
    (sometime-before  (pred_3 obj_06 obj_03) (pred_5 obj_04))
    (sometime-before  (pred_3 obj_05 obj_03) (pred_5 obj_04))
  )
)
)