(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_3
obj_12 obj_08 obj_13 obj_02 - type_2
obj_07 obj_14 obj_03 obj_09 - type_1
obj_01 obj_11 obj_04 obj_05 - object)
(:init
(pred_2 obj_06 obj_03)
(pred_1 obj_06 obj_12)
(pred_1 obj_06 obj_08)
(pred_2 obj_10 obj_07)
(pred_1 obj_10 obj_13)
(pred_1 obj_10 obj_02)
(pred_3 obj_01 obj_09)
(pred_3 obj_11 obj_09)
(pred_3 obj_04 obj_07)
(pred_3 obj_05 obj_07)
)
(:goal
(and
(pred_3 obj_01 obj_07)
(pred_3 obj_11 obj_09)
(pred_3 obj_04 obj_09)
(pred_3 obj_05 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_06 obj_09) (pred_2 obj_10 obj_09))))
  )
)
)