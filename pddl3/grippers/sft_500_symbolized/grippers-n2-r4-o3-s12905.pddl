(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_3
obj_07 obj_10 obj_02 obj_13 - type_2
obj_03 obj_05 obj_09 obj_01 - type_1
obj_12 obj_04 obj_06 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_1 obj_08 obj_07)
(pred_1 obj_08 obj_10)
(pred_3 obj_11 obj_03)
(pred_1 obj_11 obj_02)
(pred_1 obj_11 obj_13)
(pred_4 obj_12 obj_03)
(pred_4 obj_04 obj_05)
(pred_4 obj_06 obj_09)
)
(:goal
(and
(pred_4 obj_12 obj_09)
(pred_4 obj_04 obj_05)
(pred_4 obj_06 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_09) (pred_3 obj_11 obj_09))))
  )
)
)