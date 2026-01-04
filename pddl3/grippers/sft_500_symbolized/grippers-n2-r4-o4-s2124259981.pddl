(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_13 - type_1
obj_06 obj_01 obj_08 obj_11 - type_3
obj_05 obj_02 obj_07 obj_09 - type_2
obj_04 obj_03 obj_12 obj_10 - object)
(:init
(pred_2 obj_14 obj_02)
(pred_1 obj_14 obj_06)
(pred_1 obj_14 obj_01)
(pred_2 obj_13 obj_09)
(pred_1 obj_13 obj_08)
(pred_1 obj_13 obj_11)
(pred_4 obj_04 obj_07)
(pred_4 obj_03 obj_02)
(pred_4 obj_12 obj_02)
(pred_4 obj_10 obj_09)
)
(:goal
(and
(pred_4 obj_04 obj_07)
(pred_4 obj_03 obj_05)
(pred_4 obj_12 obj_09)
(pred_4 obj_10 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_14 obj_09) (pred_2 obj_13 obj_09))))
  )
)
)