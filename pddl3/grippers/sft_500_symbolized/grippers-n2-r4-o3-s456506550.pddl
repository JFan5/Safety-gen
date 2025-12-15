(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_3
obj_13 obj_12 obj_01 obj_02 - type_2
obj_09 obj_05 obj_08 obj_03 - type_1
obj_07 obj_06 obj_04 - object)
(:init
(pred_1 obj_10 obj_08)
(pred_4 obj_10 obj_13)
(pred_4 obj_10 obj_12)
(pred_1 obj_11 obj_05)
(pred_4 obj_11 obj_01)
(pred_4 obj_11 obj_02)
(pred_3 obj_07 obj_03)
(pred_3 obj_06 obj_05)
(pred_3 obj_04 obj_05)
)
(:goal
(and
(pred_3 obj_07 obj_09)
(pred_3 obj_06 obj_09)
(pred_3 obj_04 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_09) (pred_1 obj_11 obj_09))))
  )
)
)