(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_03 - type_1
obj_13 obj_11 obj_12 obj_08 - type_3
obj_01 obj_05 obj_04 obj_09 - type_2
obj_07 obj_02 obj_06 obj_10 - object)
(:init
(pred_3 obj_14 obj_01)
(pred_4 obj_14 obj_13)
(pred_4 obj_14 obj_11)
(pred_3 obj_03 obj_09)
(pred_4 obj_03 obj_12)
(pred_4 obj_03 obj_08)
(pred_2 obj_07 obj_01)
(pred_2 obj_02 obj_01)
(pred_2 obj_06 obj_09)
(pred_2 obj_10 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_09)
(pred_2 obj_02 obj_05)
(pred_2 obj_06 obj_01)
(pred_2 obj_10 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_14 obj_09) (pred_3 obj_03 obj_09))))
  )
)
)