(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_3
obj_06 obj_07 obj_14 obj_13 - type_2
obj_09 obj_02 obj_10 obj_11 - type_1
obj_04 obj_08 obj_05 obj_03 - object)
(:init
(pred_1 obj_12 obj_09)
(pred_3 obj_12 obj_06)
(pred_3 obj_12 obj_07)
(pred_1 obj_01 obj_02)
(pred_3 obj_01 obj_14)
(pred_3 obj_01 obj_13)
(pred_2 obj_04 obj_10)
(pred_2 obj_08 obj_11)
(pred_2 obj_05 obj_09)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_09)
(pred_2 obj_08 obj_02)
(pred_2 obj_05 obj_02)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_12 obj_02) (pred_1 obj_01 obj_02))))
  )
)
)