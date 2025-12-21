(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_14 - type_1
obj_07 obj_11 obj_08 obj_02 - type_2
obj_06 obj_09 obj_13 obj_12 - type_3
obj_05 obj_10 obj_01 obj_03 - object)
(:init
(pred_1 obj_04 obj_13)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_11)
(pred_1 obj_14 obj_12)
(pred_3 obj_14 obj_08)
(pred_3 obj_14 obj_02)
(pred_2 obj_05 obj_06)
(pred_2 obj_10 obj_09)
(pred_2 obj_01 obj_06)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_09)
(pred_2 obj_10 obj_13)
(pred_2 obj_01 obj_06)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_09) (pred_1 obj_14 obj_09))))
  )
)
)