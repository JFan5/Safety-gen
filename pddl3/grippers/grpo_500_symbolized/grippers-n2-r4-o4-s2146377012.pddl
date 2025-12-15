(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_13 - type_1
obj_07 obj_02 obj_14 obj_08 - type_3
obj_10 obj_05 obj_11 obj_03 - type_2
obj_01 obj_12 obj_09 obj_04 - object)
(:init
(pred_3 obj_06 obj_03)
(pred_4 obj_06 obj_07)
(pred_4 obj_06 obj_02)
(pred_3 obj_13 obj_05)
(pred_4 obj_13 obj_14)
(pred_4 obj_13 obj_08)
(pred_2 obj_01 obj_10)
(pred_2 obj_12 obj_11)
(pred_2 obj_09 obj_03)
(pred_2 obj_04 obj_11)
)
(:goal
(and
(pred_2 obj_01 obj_10)
(pred_2 obj_12 obj_11)
(pred_2 obj_09 obj_11)
(pred_2 obj_04 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_06 obj_11) (pred_3 obj_13 obj_11))))
  )
)
)