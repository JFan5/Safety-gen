(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_08 - type_1
obj_14 obj_12 obj_05 obj_07 - type_2
obj_04 obj_11 obj_10 obj_09 - type_3
obj_03 obj_13 obj_06 obj_02 - object)
(:init
(pred_1 obj_01 obj_11)
(pred_2 obj_01 obj_14)
(pred_2 obj_01 obj_12)
(pred_1 obj_08 obj_09)
(pred_2 obj_08 obj_05)
(pred_2 obj_08 obj_07)
(pred_3 obj_03 obj_09)
(pred_3 obj_13 obj_09)
(pred_3 obj_06 obj_10)
(pred_3 obj_02 obj_09)
)
(:goal
(and
(pred_3 obj_03 obj_09)
(pred_3 obj_13 obj_09)
(pred_3 obj_06 obj_09)
(pred_3 obj_02 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_01 obj_09) (pred_1 obj_08 obj_09))))
  )
)
)